# 🏢 Enterprise Linux Server: File Services & Real-time Monitoring

A robust, industry-standard Linux Server setup featuring centralized file sharing, multi-level user permissions, automated system health reporting, and a live GUI monitoring dashboard.

## 🚀 Features
* **User Management:** Department-based access control (HR, IT, Staff groups).
* **File Services:** Samba implementation for cross-platform (Windows/Linux) file sharing.
* **Security:** Rigid Linux permissions (chmod/chown) to protect departmental data.
* **Automation:** Custom Bash scripts and Cron jobs for daily health audits.
* **Monitoring:** Live, web-based performance tracking via **Netdata**.

---

## 🏗️ System Architecture
- **OS:** Ubuntu Server 22.04 LTS
- **Services:** Samba (SMB/CIFS), SSH, Apache2, Netdata
- **Automation:** Shell Scripting + Crontab

---

## 🛠️ Implementation Details

### 1. User & Group Hierarchy
| Group | Members | Access Level |
| :--- | :--- | :--- |
| **it** | it1 | Full Admin / Share Owner |
| **hr** | hr1 | Read/Write (Departmental) |
| **staff** | staff1 | General Access |

### 2. File Sharing (Samba)
The share is located at `/srv/company_share`. Configuration ensures that only authorized users in the `it` group can manage the directory, while maintaining a `0770` mask for security.

### 3. Monitoring & Automation
A custom script `system_monitor.sh` was developed to track:
- CPU Load & Uptime
- RAM Utilization
- Disk Space (DF)
- Critical Service Status (Samba/SSH)

**Automation:** A Cron job is configured to run this audit daily at **09:00 AM**, logging results to `/var/log/monitoring/system_report.log`.

---

## 📊 Visualizations (Netdata)
The server provides a real-time GUI dashboard accessible at `http://192.168.17.128:19999`.


---

## 🔧 How to Deploy
1. Clone this repository.
2. Run the user creation commands found in the documentation.
3. Move `system_monitor.sh` to `/opt/monitoring/`.
4. Update your Samba config with the provided `samba_backup.conf`.
5. Install Netdata: `sudo apt install netdata`.
