# Docker-Installasjon for DATA1500 - Oppgavesett 1.3

Denne veiledningen viser hvordan du installerer Docker, docker-compose og PostgreSQL for oppgavesett 1.3.

**Velg ditt operativsystem:**
- [macOS (Apple Silicon eller Intel)](#macos)
- [Windows (WSL 2)](#windows)
- [Linux (Ubuntu/Debian)](#linux)

---

## macOS

### Systemkrav

- **macOS 11 (Big Sur)** eller nyere
- **Apple Silicon (M1/M2/M3/M4)** eller **Intel processor**
- **4 GB RAM** (minimum, 8 GB anbefalt)
- **10 GB ledig diskplass**

### Steg 1: Installer Docker Desktop

#### For Apple Silicon (M1/M2/M3/M4)

1. Gå til [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop)
2. Klikk **"Download for Apple Silicon"**
3. Åpne `Docker.dmg` som lastes ned
4. Dra **Docker.app** til **Applications**-mappen
5. Åpne **Applications** → dobbeltklikk **Docker.app**
6. Skriv inn passord når du blir spurt (Docker trenger administratorrettigheter)
7. Vent til Docker starter (du ser Docker-ikonet øverst i menylinja)

#### For Intel Mac

1. Gå til [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop)
2. Klikk **"Download for Intel Chip"**
3. Følg samme prosess som over

### Steg 2: Verifiser Installasjon

Åpne **Terminal** og kjør:

```bash
docker --version
# Forventet output: Docker version 24.0.0 (eller nyere)

docker run hello-world
# Forventet output: "Hello from Docker!"
```

Hvis du får "command not found", lukk Terminal og åpne den på nytt.

### Steg 3: Installer docker-compose (Hvis Nødvendig)

Docker Desktop for Mac inkluderer docker-compose. Verifiser:

```bash
docker-compose --version
# Forventet output: Docker Compose version 2.x.x
```

Hvis det ikke fungerer, installer via Homebrew:

```bash
brew install docker-compose
```

### Steg 4: Start PostgreSQL

```bash
# Naviger til oppgavemappen
cd /path/to/data1500-oving-03

# Start PostgreSQL
docker-compose up -d

# Verifiser at serveren kjører
docker-compose ps
```

**Forventet output:**
```
NAME                  STATUS
data1500-postgres     Up 2 minutes
```

### Steg 5: Test Tilkobling

```bash
# Interaktiv psql-shell
docker-compose exec postgres psql -U admin -d data1500_db

# I psql-shell:
data1500_db=# SELECT COUNT(*) FROM studenter;
# Forventet: 4

data1500_db=# \q  # Avslutt
```

---

## Windows

### Systemkrav

- **Windows 10 (Build 19041)** eller **Windows 11**
- **WSL 2** (Windows Subsystem for Linux 2)
- **4 GB RAM** (minimum, 8 GB anbefalt)
- **10 GB ledig diskplass**
- **Virtualisering aktivert** i BIOS

### Steg 1: Aktivér WSL 2

Åpne **PowerShell som Administrator** og kjør:

```powershell
# Aktivér WSL
wsl --install

# Installer Ubuntu-distribusjon
wsl --install -d Ubuntu

# Verifiser WSL 2
wsl --list --verbose
# Forventet: Ubuntu med VERSION 2
```

**Hvis du får feil:**

```powershell
# Aktivér Windows-funksjoner manuelt
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Start datamaskinen på nytt
Restart-Computer
```

### Steg 2: Installer Docker Desktop

1. Gå til [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop)
2. Klikk **"Download for Windows"**
3. Kjør **Docker Desktop Installer.exe**
4. I installasjonsvinduet:
   - ✅ Velg **"Install required Windows components for WSL 2"**
   - ✅ Velg **"Add Docker Desktop to the PATH"**
5. Klikk **"Install"**
6. Datamaskinen starter på nytt
7. Logg inn igjen, Docker starter automatisk

### Steg 3: Verifiser Installasjon

Åpne **PowerShell** og kjør:

```powershell
docker --version
# Forventet output: Docker version 24.0.0 (eller nyere)

docker run hello-world
# Forventet output: "Hello from Docker!"
```

### Step 4: Konfigurer Docker Desktop

1. Åpne **Docker Desktop**
2. Klikk **Settings** (tannhjul-ikonet)
3. Gå til **Resources** → **WSL Integration**
4. Aktivér **Ubuntu** (hvis det ikke allerede er aktivert)
5. Klikk **Apply & Restart**

### Steg 5: Start PostgreSQL

Åpne **PowerShell** eller **WSL Ubuntu Terminal**:

```powershell
# Naviger til oppgavemappen
cd C:\path\to\data1500-oving-03

# Start PostgreSQL
docker-compose up -d

# Verifiser at serveren kjører
docker-compose ps
```

**Forventet output:**
```
NAME                  STATUS
data1500-postgres     Up 2 minutes
```

### Steg 6: Test Tilkobling

```powershell
# Interaktiv psql-shell
docker-compose exec postgres psql -U admin -d data1500_db

# I psql-shell:
data1500_db=# SELECT COUNT(*) FROM studenter;
# Forventet: 4

data1500_db=# \q  # Avslutt
```

### Steg 7 (Opsjonelt): Bruk WSL Ubuntu Terminal

Du kan også bruke WSL Ubuntu Terminal i stedet for PowerShell:

```bash
# Åpne WSL Ubuntu Terminal
wsl

# Naviger til oppgavemappen
cd /mnt/c/path/to/data1500-oving-03

# Start PostgreSQL
docker-compose up -d
```

---

## Linux

### Systemkrav

- **Ubuntu 20.04 LTS** eller nyere (eller Debian 11+)
- **4 GB RAM** (minimum, 8 GB anbefalt)
- **10 GB ledig diskplass**
- **sudo-tilgang**

### Steg 1: Installer Docker

Åpne **Terminal** og kjør:

```bash
# Oppdater pakkelisten
sudo apt-get update

# Installer Docker
sudo apt-get install -y docker.io

# Installer docker-compose
sudo apt-get install -y docker-compose

# Legg til din bruker i docker-gruppen (så du ikke trenger sudo)
sudo usermod -aG docker $USER

# Aktiver gruppen (eller logg ut/inn igjen)
newgrp docker

# Verifiser at det fungerer
docker --version
docker-compose --version
```

### Steg 2: Verifiser Installasjon

```bash
docker run hello-world
# Forventet output: "Hello from Docker!"
```

### Steg 3: Start PostgreSQL

```bash
# Naviger til oppgavemappen
cd /path/to/data1500-oving-03

# Start PostgreSQL
docker-compose up -d

# Verifiser at serveren kjører
docker-compose ps
```

**Forventet output:**
```
NAME                  STATUS
data1500-postgres     Up 2 minutes
```

### Steg 4: Test Tilkobling

```bash
# Interaktiv psql-shell
docker-compose exec postgres psql -U admin -d data1500_db

# I psql-shell:
data1500_db=# SELECT COUNT(*) FROM studenter;
# Forventet: 4

data1500_db=# \q  # Avslutt
```

---

## Feilsøking

### "Port 5432 is already in use"

**Problem:** En annen PostgreSQL-instans kjører allerede.

**Løsning:**

```bash
# Stopp den gamle instansen
docker-compose down

# Eller bruk en annen port i docker-compose.yml
# Endre: - "5432:5432" til - "5433:5432"
```

### "Cannot connect to Docker daemon"

**Problem:** Docker kjører ikke.

**Løsning:**

- **macOS/Windows:** Start Docker Desktop
- **Linux:** Kjør `sudo systemctl start docker`

### "Permission denied while trying to connect to Docker daemon"

**Problem:** Du har ikke tilgang til Docker.

**Løsning (Linux):**

```bash
sudo usermod -aG docker $USER
# Logg ut og inn igjen
```

### "Init-scripts not running" (Windows)

**Problem:** PostgreSQL starter, men init-scripts kjøres ikke.

**Løsning:**

```powershell
# Slett volumet
docker-compose down -v

# Start på nytt
docker-compose up -d

# Sjekk logs
docker-compose logs postgres | Select-String "running /docker-entrypoint-initdb.d"
```

### "Cannot execute: required file not found" (WSL)

**Problem:** Shell-skript har feil line endings.

**Løsning (WSL Ubuntu):**

```bash
# Konverter til LF
dos2unix test-oppgave1.sh

# Gjør kjørbar
chmod +x test-oppgave1.sh
```

---

## Neste Steg

Når PostgreSQL kjører, kan du:

1. **Kjøre test-skriptene:**
   ```bash
   docker-compose exec postgres psql -U admin -d data1500_db -f /test-scripts/test-oppgave2.sql
   ```

2. **Kjøre oppgavene:**
   - Følg instruksjonene i `oppgave1.md`, `oppgave2.md`, etc.

3. **Koble til med GUI-verktøy:**
   - Installer [pgAdmin](https://www.pgadmin.org/) eller [DBeaver](https://dbeaver.io/)
   - Host: `localhost`
   - Port: `5432`
   - Username: `admin`
   - Password: `admin123`

---

## Ressurser (sist sjekket 2026-01-20)

- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [WSL 2 Documentation](https://docs.microsoft.com/en-us/windows/wsl/)

---

**Lykke til med oppgavene! 🎓**
