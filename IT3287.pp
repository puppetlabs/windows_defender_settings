#Enforce Registry keys to manage Windows Defender settings

#forces Windows Defender antivirus into a perpetually on state
# Ensure the key exists
registry_key { 'HKLM\Software\Policies\Microsoft\Windows Defender':
  ensure => present,
}

#the meaning of this vaule is that the abillity to turn off Windows Defender is disabled
# Set the value
registry_value { 'HKLM\Software\Policies\Microsoft\Windows Defender\DisableAntiSpyware':
  ensure => present,
  type   => dword,
  data   => 0,
}

#update definitions before a scan
# Ensure the key exists
registry_key { 'HKLM\Software\Policies\Microsoft\Windows Defender\Scan':
  ensure => present,
}

#set the value
registry_value { 'HKLM\Software\Policies\Microsoft\Windows Defender\Scan\CheckForSignaturesBeforeRunningScan':
  ensure => present,
  type   => dword,
  data   => 1,
}

#enable headless UI mode (makes it impossible for users to interact w/ the interface)
# Ensure the key exists
registry_key { 'HKLM\Software\Policies\Microsoft\Windows Defender\UX Configuration':
  ensure => present,
}

#set the value
registry_value { 'HKLM\Software\Policies\Microsoft\Windows Defender\UX Configuration\UILockdown':
  ensure => present,
  type   => dword,
  data   => 1,
}
