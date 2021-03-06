function Copy-OctopusMachinePolicies
{
    param(
        $SourceData,
        $DestinationData,
        $CloneScriptOptions
    )

    $filteredList = Get-OctopusFilteredList -itemList $sourceData.MachinePolicyList -itemType "Machine Policies" -filters $cloneScriptOptions.MachinePoliciesToClone

    if ($filteredList.length -eq 0)
    {
        return
    }
    
    foreach ($machinePolicy in $filteredList)
    {
        Write-OctopusVerbose "Starting clone of machine policy $($machinePolicy.Name)"

        $matchingItem = Get-OctopusItemByName -ItemName $machinePolicy.Name -ItemList $destinationData.MachinePolicyList         

        $machinePolicyToClone = Copy-OctopusObject -ItemToCopy $machinePolicy -ClearIdValue $true -SpaceId $destinationData.SpaceId  
        
        if ($null -ne $matchingItem)
        {
            $machinePolicyToClone.Id = $matchingItem.Id
        }

        $updatedMachinePolicy = Save-OctopusMachinePolicy -MachinePolicy $machinePolicyToClone -destinationData $DestinationData 
        $destinationData.MachinePolicyList = Update-OctopusList -itemList $destinationData.MachinePolicyList -itemToReplace $updatedMachinePolicy
    }    

    Write-OctopusSuccess "Machine policies successfully cloned"        
}