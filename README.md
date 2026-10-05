# reset-crossover-trial

A collection of Bash scripts to reset the CrossOver trial period on macOS. It includes a tool to reset the main application trial and another to fix expired bottles.

## How it works

### 1. Main Application Reset (`reset-crossover.sh`)
CrossOver stores the date of its first launch in:

```text
~/Library/Preferences/com.codeweavers.CrossOver.plist
```

The script reads that file and overwrites the `FirstRunDate` value with the current UTC date, effectively resetting the 14-day trial countdown.

### 2. Bottles Reset (`reset-crossover-bottles.sh`)
Each CrossOver bottle maintains its own independent registry and trial status. If your bottles expire before the main application, this script iterates through all your bottles and removes the `[Software\CodeWeavers\CrossOver]` registry block from their `system.reg` files, resetting their individual trial states.

## Requirements

- macOS
- CrossOver installed

## Usage

### 1. Clone the repository

```bash
git clone [https://github.com/Loren844/reset-crossover-trial.git](https://github.com/Loren844/reset-crossover-trial.git)
cd reset-crossover-trial
```

### 2. Make the scripts executable

```bash
chmod +x reset-crossover.sh
chmod +x reset-crossover-bottles.sh
```

### 3. Run the scripts

To reset the main CrossOver trial:

```bash
./reset-crossover.sh
```

To fix expired bottles:

```bash
./reset-crossover-bottles.sh
```

## Notes

- Quit CrossOver entirely before running either script to avoid your changes being overwritten.
- `reset-crossover.sh` exits with an error if the `.plist` file is not found or if the `FirstRunDate` key does not exist. The plist is saved in `binary1` format after editing.
- `reset-crossover-bottles.sh` automatically creates backups (`system.reg.bak`) of your registry files before modifying them.