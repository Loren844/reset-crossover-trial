# reset-crossover-trial

A simple Bash script that resets the CrossOver trial period on macOS by updating the `FirstRunDate` key in its preferences file to today's date.

## How it works

CrossOver stores the date of its first launch in:

```
~/Library/Preferences/com.codeweavers.CrossOver.plist
```

The script reads that file and overwrites the `FirstRunDate` value with the current UTC date, effectively resetting the 14-day trial countdown.

## Requirements

- macOS
- CrossOver installed (so the `.plist` file exists)
- `PlistBuddy` and `plutil` — both are built into macOS, no installation needed

## Usage

### 1. Clone the repository

```bash
git clone https://github.com/Loren844/reset-crossover-trial.git
cd reset-crossover-trial
```

### 2. Make the script executable

```bash
chmod +x reset-crossover.sh
```

### 3. Run the script

```bash
./reset-crossover.sh
```

If successful, you will see:

```
FirstRunDate updated: 2026-03-03 14:00:00 +0000
```

## Notes

- The script exits with an error if the `.plist` file is not found or if the `FirstRunDate` key does not exist.
- The plist is saved in `binary1` format after editing, which is the format macOS expects.
- Quit CrossOver before running the script to avoid your changes being overwritten.
