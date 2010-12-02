getWindowsSDKDir()
{
    oldIFS=$IFS
    IFS="!"
    x=$(reg query 'HKLM\SOFTWARE\Microsoft\Microsoft SDKs\Windows' /v 'CurrentInstallFolder' | grep 'CurrentInstallFolder' | sed 's/^.*REG_SZ[ 	]*//')

    if [ -n $x ]
    then
        export WindowsSdkDir=$x
        export BashWindowsSdkDir=$(echo "$x" | sed 's|\\|/|g')
    fi
}
