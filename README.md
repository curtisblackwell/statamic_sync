# How to Use
1. [Set up an SSH account on your remote server.](http://kb.site5.com/shell-access-ssh/how-to-generate-ssh-keys-and-login-to-your-account-with-ssh/?id=185945)
2. Drop the `sync` folder into a folder called `scripts`.

   ```
   my-site/
     scripts/
       sync/
         _vars.sh
         remote_to_local.sh
   ```
3. In Terminal, navigate to the root directory `cd Sites/my-site`.
4. Run `sh scripts/sync/remote_to_local.sh`.
