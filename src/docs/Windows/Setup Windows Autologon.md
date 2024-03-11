Press ```Windows``` + ```R```

In the run box, type ```regedit``` then press enter

Navigate to the following path in regedit...

```HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon```

Right-click ```Winlogon``` and select ```New``` -> ```DWORD (32-bit) Value```

Set the key name as ```AutoAdminLogon``` and the value to ```1```

Right click```Winlogon``` again and select ```New``` -> ```String Value```

Set the key name as ```DefaultUserName``` and the value to your username

Repeat the last two steps with the key name being ```DefaultPassword```

If you have joined the computer to a domain, you should also create a String Value called ```DefaultDomainName```

Once completed, restart your PC and it should login automatically