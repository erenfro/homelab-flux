/var/www/html/occ app:install user_ldap
/var/www/html/occ app:enable user_ldap
/var/www/html/occ ldap:create-empty-config

# EDIT: domain
/var/www/html/occ ldap:set-config s01 ldapHost "ldap://lldap.security.svc.cluster.local"
/var/www/html/occ ldap:set-config s01 ldapPort 389
# EDIT: admin user
/var/www/html/occ ldap:set-config s01 ldapAgentName "uid=readonly,ou=people,dc=home,dc=ld"
# EDIT: password
/var/www/html/occ ldap:set-config s01 ldapAgentPassword "PASSWORD"
# EDIT: Base DN
/var/www/html/occ ldap:set-config s01 ldapBase "dc=home,dc=ld"
/var/www/html/occ ldap:set-config s01 ldapBaseUsers "dc=home,dc=ld"
/var/www/html/occ ldap:set-config s01 ldapBaseGroups "dc=home,dc=ld"
/var/www/html/occ ldap:set-config s01 ldapConfigurationActive 1
/var/www/html/occ ldap:set-config s01 ldapLoginFilter "(&(objectclass=person)(uid=%uid))"
# EDIT: nextcloud_users group, contains the users who can login to Nextcloud
/var/www/html/occ ldap:set-config s01 ldapUserFilter "(&(objectclass=person)(memberOf=cn=nextcloud,ou=groups,dc=home,dc=ld))"
/var/www/html/occ ldap:set-config s01 ldapUserFilterMode 0
/var/www/html/occ ldap:set-config s01 ldapUserFilterObjectclass person
/var/www/html/occ ldap:set-config s01 turnOnPasswordChange 0
/var/www/html/occ ldap:set-config s01 ldapCacheTTL 600
/var/www/html/occ ldap:set-config s01 ldapExperiencedAdmin 0
/var/www/html/occ ldap:set-config s01 ldapGidNumber gidNumber
# EDIT: list of application groups
/var/www/html/occ ldap:set-config s01 ldapGroupFilter "(&(objectclass=groupOfUniqueNames)(|(cn=nextcloud)))"
# EDIT: list of application groups
/var/www/html/occ ldap:set-config s01 ldapGroupFilterGroups "nextcloud"
/var/www/html/occ ldap:set-config s01 ldapGroupFilterMode 0
/var/www/html/occ ldap:set-config s01 ldapGroupDisplayName cn
/var/www/html/occ ldap:set-config s01 ldapGroupFilterObjectclass groupOfUniqueNames
/var/www/html/occ ldap:set-config s01 ldapGroupMemberAssocAttr uniqueMember
/var/www/html/occ ldap:set-config s01 ldapEmailAttribute "mail"
/var/www/html/occ ldap:set-config s01 ldapLoginFilterEmail 0
/var/www/html/occ ldap:set-config s01 ldapLoginFilterUsername 1
/var/www/html/occ ldap:set-config s01 ldapMatchingRuleInChainState unknown
/var/www/html/occ ldap:set-config s01 ldapNestedGroups 0
/var/www/html/occ ldap:set-config s01 ldapPagingSize 500
/var/www/html/occ ldap:set-config s01 ldapTLS 0
/var/www/html/occ ldap:set-config s01 ldapUserAvatarRule default
/var/www/html/occ ldap:set-config s01 ldapUserDisplayName displayname
/var/www/html/occ ldap:set-config s01 ldapUserFilterMode 1
/var/www/html/occ ldap:set-config s01 ldapUuidGroupAttribute auto
/var/www/html/occ ldap:set-config s01 ldapUuidUserAttribute auto
