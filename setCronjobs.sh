# Make sure we have all the environment variables
./bashrc

temp_folder_name = "temp"
temp_cron_file_name = "cronjobs"

setup_auth_keys() {
  echo "Setup Auth Keys"
  desc = "Pull Public Keys From Github"
  job = "*/5 * * * * wget -r https://github.com/$github_account.keys -O ~/.ssh/authorized_keys"

  exists = check_cron $desc
  if [[ $exists -eq $false ]];
  then
    check_cron_temp
    echo $desc >> $temp_folder_name/$temp_cron_file_name
    echo $job >> $temp_folder_name/$temp_cron_file_name
  fi
}


check_cron() {
  # given a cron description, checks that the description is in the file
  # returns 1 (true) if description exists in crontab
  # returns 0 (false) if description does not exist in crontab
  # returns 1 (true) if description was not passed
    # this exists to short circuit the existing cron functions
  if [[ $# -lt 1 ]];
  then
    echo "Arg not passed to check cron"
    true
  fi

  desc = $1

  search = $(contab -l | grep $desc)

  if [[ $search -eq 0 ]];
  then
    # cronjob exists exists
    true
  else
    # cronjob doesn't exist
    false
  fi
}

check_cron_temp() {
  if [ -d "temp"];
  then
    echo "Temp folder already exists, skipping"
  else
    echo "Creating temp folder"
    mkdir $temp_folder_name
  fi
}

setup_auth_keys()
