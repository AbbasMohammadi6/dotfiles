Make the scripts executable:
chmod +x ~/dotfiles/scripts/resource-monitor.sh

Launch it from your i3 config so it starts with your session:
exec --no-startup-id ~/dotfiles/scripts/resource-monitor.sh

Use stress-ng to test resource-monitor script
