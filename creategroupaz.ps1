#Connect to tenant
Connect-AzureAD

#Create two groups with every user and device in them.
New-AzureADMSGroup -DisplayName "ALL W10 MACHINE" -Description "All W10 Machines" -MailEnabled $False -MailNickName "group" -SecurityEnabled $True -GroupTypes "DynamicMembership" -membershipRule "(device.deviceOSType -eq ""Windows"")" -membershipRuleProcessingState "On"
New-AzureADMSGroup -DisplayName "All Users" -Description "All Users in Org " -MailEnabled $False -MailNickName "group" -SecurityEnabled $True -GroupTypes "DynamicMembership" -membershipRule "All Users" -membershipRuleProcessingState "On"