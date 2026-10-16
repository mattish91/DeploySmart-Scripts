# Office

Office deployment and activation scripts. The XML files in `assets/` are
generic Office Deployment Tool examples, not tenant-specific configurations.

**Activation scripts require user attention before use.** In DeploySmart,
open the imported script under **Custom Scripts**, edit the `$KmsServer`
assignment near the top, and replace `REPLACE_WITH_YOUR_AUTHORIZED_KMS_SERVER`
with your organization's authorized KMS host. The script stops without
activating while the placeholder remains unchanged. If you do not use KMS
activation, remove or do not import the relevant activation script.

These scripts do not provision a license or KMS service. Verify that the
Windows/Office edition and your licensing terms permit KMS activation. Review
the script and its required KMS setting before adding it to your custom script
library or deploying it.
