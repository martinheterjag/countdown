# Morgonrutin

A kid-friendly morning routine display for a TV. It shows the routine tasks with pictures on the left and a countdown to leaving home on the right. The current weather is shown in the bottom right corner.

## What is shown when

| Time          | Timer shows                                                      |
|---------------|------------------------------------------------------------------|
| 00:00 – 05:45 | Countdown, full circle, more than 45 minutes left                |
| 05:45 – 06:30 | Countdown, the circle shrinks and changes colour                 |
| 06:30 – 09:00 | "Dags att gå! 🚀" (time to go)                                    |
| 09:00 – 24:00 | 🚽 "Är du bajsnödig?" (do you need to poop?)                       |

Countdown colours:

- **Blue**: more than 15 minutes left
- **Yellow**: 5–15 minutes left
- **Red**: less than 5 minutes left

The weather updates every 15 minutes from [Open-Meteo](https://open-meteo.com/). It is hidden if there is no network.

## Settings

The settings are at the top of the `<script>` in `index.html`:

| Setting  | Default   | Meaning                                    |
|----------|-----------|--------------------------------------------|
| `WAKE`   | `05:45`   | When the countdown circle starts shrinking |
| `LEAVE`  | `06:30`   | When it is time to go                      |
| `NIGHT`  | `09:00`   | When the toilet message starts             |
| `PLACE`  | Norrköping | Coordinates for the weather               |
| `TASKS`  |           | The routine tasks, in order                |

## Testing other times

Add `?tid=HH:MM` to the URL to start the clock at that time:

```text
index.html?tid=06:20
```

## Raspberry Pi with RetroPie

`setup-pi.sh` installs the page as a RetroPie port. Copy both files to the Pi and run the script there:

```bash
scp index.html setup-pi.sh pi@<pi-address>:
ssh pi@<pi-address> 'bash setup-pi.sh'
```

Then restart EmulationStation and choose **Ports → Morgonrutin**. The page runs in full screen until the Pi is restarted.

Notes:

- The Pi needs the correct time zone: `sudo timedatectl set-timezone Europe/Stockholm`.
- The emoji font on Raspbian Buster is from 2018, so newer emojis show as boxes.
