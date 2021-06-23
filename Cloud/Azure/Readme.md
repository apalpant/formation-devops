alexandre.palpant@ibcegos1gmail.onmicrosoft.com 

https://github.com/vanessakovalsky/azure-training/blob/master/intro-azure.md

https://github.com/vanessakovalsky/azure-training/blob/master/tp-create-user-and-group.md

https://github.com/vanessakovalsky/azure-training/blob/master/tp-create-storage.md

$rgName = 'az104-04-rg1-apalpant'

New-AzResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile $HOME/az104-04-vms-loop-template.json -TemplateParameterFile $HOME/az104-04-vms-loop-parameters.json

https://github.com/vanessakovalsky/azure-training/blob/master/tp-create-vm.md

https://github.com/vanessakovalsky/azure-training/blob/master/tp-create-container-aci.md