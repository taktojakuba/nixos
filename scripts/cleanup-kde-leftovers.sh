#!/usr/bin/env bash
# cleanup-kde-leftovers.sh — remove KDE/Plasma leftovers from $HOME after
# switching this machine to Sway.
#
# Usage:
#   ./cleanup-kde-leftovers.sh           # dry run: only prints what would go
#   ./cleanup-kde-leftovers.sh --apply   # actually delete the files
#   ./cleanup-kde-leftovers.sh --all     # also touch KDE PIM/wallet/kdeconnect
#   ./cleanup-kde-leftovers.sh --all --apply
#
# Nix store entries are not touched here. After this, run `nh clean all` (or
# `sudo nix-collect-garbage -d`) to drop the old KDE packages from /nix/store.

set -euo pipefail

apply=0
include_app_data=0

usage() {
  sed -n '2,13p' "$0"
}

for arg in "$@"; do
  case "$arg" in
    -h | --help)
      usage
      exit 0
      ;;
    --apply) apply=1 ;;
    --all) include_app_data=1 ;;
    *)
      echo "Unknown option: $arg (try --help)" >&2
      exit 2
      ;;
  esac
done

home="${HOME:?HOME is not set}"

shopt -s nullglob dotglob

# --------------------------------------------------------------------------
# KDE/Plasma config, data, cache and state. Patterns are relative to the
# directory they are listed under. All patterns are quoted on purpose: an
# unquoted glob inside an array literal would be expanded by bash against the
# current working directory when the script starts.
# --------------------------------------------------------------------------

config_patterns=(
  # Plasma / KWin / system settings
  'kdeglobals' 'kdedefaults' 'kded5rc' 'kded6rc' 'kde.org'
  'kglobalaccelrc' 'kglobalshortcutsrc' 'khotkeysrc' 'kaccessrc'
  'ksmserverrc' 'ksplashrc' 'kscreenlockerrc'
  'kwinrc' 'kwinrulesrc' 'kwinoutputconfig.json'
  'powerdevilrc' 'kcminputrc' 'kcmdisplayrc' 'kcmfonts'
  'krunnerrc' 'kmenuedit' 'knotifyrc' 'klipperrc' 'kmixrc' 'kxkbrc'
  'kactivitymanagerdrc' 'kactivitymanagerd-statsrc'
  'plasmarc' 'plasmashellrc' 'plasmanotifyrc' 'plasmaparc'
  'plasma-localerc' 'plasma-org.kde.*'
  'kdecustomfolders' 'ksslcertificatemanagerrc'
  'KDE' 'kded6'
  'session'
  # KDE apps (settings only)
  'arkrc' 'gwenviewrc' 'okularrc' 'spectaclerc' 'kdenliverc'
  'kcalcrc' 'kpatrc' 'kfindrc' 'kdiff3rc' 'komparerc'
  'kgetrc' 'ktorrentrc' 'k3brc'
  'konsole*' 'kate' 'katerc' 'katevirc' 'kateschemarc'
  'katesyntaxhighlightingrc' 'kate-externaltools*.rc'
  'dolphinrc' 'baloofilerc' 'baloofileinformationrc'
  'systemsettingsrc' 'kio_httprc' 'kconf_updaterc'
)

data_patterns=(
  'kactivitymanagerd' 'kate' 'dolphin' 'kscreen' 'kwin' 'baloo'
  'plasma*' 'aurorae' 'color-schemes'
  'kservices5' 'kservices6' 'kxmlgui5' 'kxmlgui6'
  'kaccounts' 'kio' 'kpackage' 'knewstuff*' 'kded6'
  'konsole' 'klipper' 'recentdocuments' 'RecentDocuments' 'user-places.xbel'
  'krunner*' 'ksystemstats' 'knotifications*'
)

cache_patterns=(
  'kde*' 'kded*' 'kio*' 'kate*' 'konsole*' 'kwin*' 'plasma*' 'kscreen*'
  'ksycoca*' 'kbuildsycoca*' 'baloo*' 'krunner*' 'kactivity*'
  'kglobalaccel*' 'kpackage*' 'ksvgtopng*' 'knewstuff*' 'knotify*'
  'klipper*' 'kxmlgui*' 'kservices*' 'ksmserver*' 'systemsettings*'
  'kcrash*' 'kinfocenter*' 'polkit-kde*' 'org.kde.*'
)

state_patterns=(
  'kde*' 'kate*' 'konsole*' 'plasma*' 'kwin*' 'baloo*' 'kscreen*'
  'kactivity*' 'kglobal*' 'kicker*' 'kinfocenter*' 'dolphin*'
  'UserFeedback.org.kde.*'
)

legacy_patterns=(
  '.kde' '.kde4' '.kde5'
)

if ((include_app_data)); then
  # KDE PIM data, kwallet secrets and KDE Connect pairings can still be
  # valuable, so they are only removed with --all.
  config_patterns+=(
    'kwalletrc' 'kwallet' 'kdeconnect'
    'akonadi*' 'kmail*' 'kaddressbookrc' 'korganizerrc' 'kontactrc'
    'akregatorrc' 'knotesrc' 'kalarmrc' 'ktimetrackerrc'
  )
  data_patterns+=(
    'kwalletd' 'akonadi*' 'kmail2' 'kaddressbook' 'korganizer' 'kontact' 'knotes'
    'kdeconnect'
  )
  state_patterns+=(
    'kwallet*' 'akonadi*' 'kmail*'
  )
  cache_patterns+=(
    'kwallet*' 'akonadi*' 'kmail*' 'kaddressbook*' 'korganizer*' 'kontact*'
  )
fi

# --------------------------------------------------------------------------

targets=()

add_paths() {
  local dir="$1" pattern path
  shift
  for pattern in "$@"; do
    for path in "$dir"/$pattern; do
      if [[ -e "$path" || -L "$path" ]]; then
        targets+=("$path")
      fi
    done
  done
}

add_paths "$home/.config" "${config_patterns[@]}"
add_paths "$home/.local/share" "${data_patterns[@]}"
add_paths "$home/.cache" "${cache_patterns[@]}"
add_paths "$home/.local/state" "${state_patterns[@]}"
add_paths "$home" "${legacy_patterns[@]}"

if ((${#targets[@]} == 0)); then
  echo "No KDE leftovers found in $home."
  exit 0
fi

# De-duplicate while keeping a stable order.
mapfile -t targets < <(printf '%s\n' "${targets[@]}" | sort -u)

total_kb=0
echo "KDE leftovers in $home:"
echo

for path in "${targets[@]}"; do
  size_kb=$(du -sk -- "$path" 2>/dev/null | cut -f1)
  size_human=$(du -sh -- "$path" 2>/dev/null | cut -f1)
  total_kb=$((total_kb + ${size_kb:-0}))
  printf '  %-64s %s\n' "$path" "${size_human:-?}"
done

echo
printf '%d path(s), %s total\n' "${#targets[@]}" "$(numfmt --to=iec --suffix=B $((total_kb * 1024)))"

if ((!apply)); then
  echo
  echo "Dry run: nothing was deleted. Re-run with --apply to delete."
  exit 0
fi

removed=0
for path in "${targets[@]}"; do
  case "$path" in
    "$home"/*)
      rm -rf -- "$path"
      removed=$((removed + 1))
      ;;
    *)
      echo "Refusing to remove $path (outside $home)" >&2
      ;;
  esac
done

echo
echo "Removed $removed path(s)."

# --------------------------------------------------------------------------
# Things this script deliberately does not delete.
# --------------------------------------------------------------------------

if [[ -d /var/lib/sddm || -d /var/cache/sddm ]]; then
  echo
  echo "System leftovers from the old SDDM display manager:"
  if [[ -d /var/lib/sddm ]]; then
    echo "  sudo rm -rf /var/lib/sddm"
  fi
  if [[ -d /var/cache/sddm ]]; then
    echo "  sudo rm -rf /var/cache/sddm"
  fi
fi

echo
echo "To reclaim space used by old KDE packages in the nix store:"
echo "  nh clean all      # or: sudo nix-collect-garbage -d"
