param virtualMachines_torsteinVM_name string = 'torsteinVM'
param disks_torsteinVM_disk1_ae7f1629dd2b454f85b5b8f17dcabd2a_externalid string = '/subscriptions/4213a5e1-2092-42a5-810b-8cc0fd3fc69e/resourceGroups/torsteinVM/providers/Microsoft.Compute/disks/torsteinVM_disk1_ae7f1629dd2b454f85b5b8f17dcabd2a'
param networkInterfaces_torsteinVM_externalid string = '/subscriptions/4213a5e1-2092-42a5-810b-8cc0fd3fc69e/resourceGroups/torsteinVM/providers/Microsoft.Network/networkInterfaces/torsteinVM'

resource virtualMachines_torsteinVM_name_resource 'Microsoft.Compute/virtualMachines@2021-11-01' = {
  name: virtualMachines_torsteinVM_name
  location: 'norwayeast'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '16.04-LTS'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_torsteinVM_name}_disk1_ae7f1629dd2b454f85b5b8f17dcabd2a'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
          id: disks_torsteinVM_disk1_ae7f1629dd2b454f85b5b8f17dcabd2a_externalid
        }
        deleteOption: 'Detach'
        diskSizeGB: 30
      }
      dataDisks: []
    }
    osProfile: {
      computerName: virtualMachines_torsteinVM_name
      adminUsername: 'username'
      linuxConfiguration: {
        disablePasswordAuthentication: false
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_torsteinVM_externalid
        }
      ]
    }
  }
}
