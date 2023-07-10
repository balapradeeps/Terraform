# NOTES:
## Provider.tf use old one 
* Still Issues with below three we commandes preferred but no luck  
 > backup_retention_period = 1
 > preferred_backup_window = "07:00-09:00"
 > skip_final_snapshot       = true
 
* Error: RDS Cluster final_snapshot_identifier is required when skip_final_snapshot is false