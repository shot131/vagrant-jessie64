#!/usr/bin/env bash
BACKUP_DIR="/vagrant/backup"

mkdir -p $BACKUP_DIR
mysqldump -u root -pvagrant sitename > "$BACKUP_DIR/sitename.sql"