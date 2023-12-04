# Notes

## Init Ldap
Run win `runuser -u www-data -- ./occ`

```shell
occ app:install user_ldap
occ app:enable user_ldap
occ ldap:create-empty-config

# EDIT: domain
occ ldap:set-config s01 ldapHost "ldap://lldap.security"
occ ldap:set-config s01 ldapPort 389
# EDIT: admin user
occ ldap:set-config s01 ldapAgentName "uid=readonly,ou=people,dc=home,dc=ld"
# EDIT: password
occ ldap:set-config s01 ldapAgentPassword "PASSWORD"
# EDIT: Base DN
occ ldap:set-config s01 ldapBase "dc=home,dc=ld"
occ ldap:set-config s01 ldapBaseUsers "dc=home,dc=ld"
occ ldap:set-config s01 ldapBaseGroups "dc=home,dc=ld"
occ ldap:set-config s01 ldapConfigurationActive 1
occ ldap:set-config s01 ldapLoginFilter "(&(objectclass=person)(uid=%uid))"
# EDIT: nextcloud_users group, contains the users who can login to Nextcloud
occ ldap:set-config s01 ldapUserFilter "(&(objectclass=person)(memberOf=cn=nextcloud,ou=groups,dc=home,dc=ld))"
occ ldap:set-config s01 ldapUserFilterMode 0
occ ldap:set-config s01 ldapUserFilterObjectclass person
occ ldap:set-config s01 turnOnPasswordChange 0
occ ldap:set-config s01 ldapCacheTTL 600
occ ldap:set-config s01 ldapExperiencedAdmin 0
occ ldap:set-config s01 ldapGidNumber gidNumber
# EDIT: list of application groups
occ ldap:set-config s01 ldapGroupFilter "(&(objectclass=groupOfUniqueNames)(|(cn=nextcloud)))"
# EDIT: list of application groups
occ ldap:set-config s01 ldapGroupFilterGroups "nextcloud"
occ ldap:set-config s01 ldapGroupFilterMode 0
occ ldap:set-config s01 ldapGroupDisplayName cn
occ ldap:set-config s01 ldapGroupFilterObjectclass groupOfUniqueNames
occ ldap:set-config s01 ldapGroupMemberAssocAttr uniqueMember
occ ldap:set-config s01 ldapEmailAttribute "mail"
occ ldap:set-config s01 ldapLoginFilterEmail 0
occ ldap:set-config s01 ldapLoginFilterUsername 1
occ ldap:set-config s01 ldapMatchingRuleInChainState unknown
occ ldap:set-config s01 ldapNestedGroups 0
occ ldap:set-config s01 ldapPagingSize 500
occ ldap:set-config s01 ldapTLS 0
occ ldap:set-config s01 ldapUserAvatarRule default
occ ldap:set-config s01 ldapUserDisplayName displayname
occ ldap:set-config s01 ldapUserFilterMode 1
occ ldap:set-config s01 ldapUuidGroupAttribute auto
occ ldap:set-config s01 ldapUuidUserAttribute auto
```
