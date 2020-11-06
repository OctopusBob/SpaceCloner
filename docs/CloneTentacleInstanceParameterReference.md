# CloneTentacleInstance.ps1 Parameter Reference

The script `CloneTentacleInstance.ps1` accepts the following parameters.

**Please Note**: You must run `CloneTentacleInstance.ps1` as an administrator or sudo or it will not work.  It is calling the `Tentacle.exe` to make changes on your machine.

## Source Information
- `SourceOctopusUrl` - the base URL of the source Octopus Server.  For example, https://samples.octopus.app.  This can be the same as the destination.
- `SourceOctopusApiKey` - the API key to access the source Octopus Server.  Recommend using the API key of a [service account](https://octopus.com/docs/security/users-and-teams/service-accounts) user.  That service account user must have read permissions.
- `SourceSpaceName` - the name of the space you wish to copy from.

## Destination Information
- `DestinationOctopusUrl` - the base URL of the destination Octopus Server. For example, https://codeaperture.octopus.app.  This can be the same as the source.
- `DestinationOctopusApiKey` - the API key to access the destination Octopus Server.  Recommend using the API key of a [service account](https://octopus.com/docs/security/users-and-teams/service-accounts) user.  Recommend that the service account has `Space Manager` permissions.
- `DestinationSpaceName` - the name of the space you wish to copy to.
- `DestinationOctopusServerThumbprint` - the thumbprint of the destination server, required to establish the two-way trust relationship.  You can get this from your Octopus Deploy instance by going to configuration -> thumbprint.

## Options

- `TentacleInstallDirectory` - Where the tentacle MSI installed the tentacle.  Defaults to `C:\Program Files\Octopus Deploy\Tentacle` for Windows and `/opt/octopus/tentacle` for Linux
- `TentacleInstanceNameToCopy` - The name of the instance on the target to copy.  Defaults to `Tentacle`.
- `ClonedTentacleType` - Indicates the type of tentacle that will be created.  Acceptable values are `AsIs` meaning whatever source is, copy it, `Polling`, meaning no matter what make it a polling tentacle and `Listening`, meaning no matter what make it a listening tentacle.
- `ClonedInstanceName` - The name of the new tentacle instance.  Defaults to `ClonedInstance`.