# ssh_jupyter_init

## usage
* Linux & MacOS installation(Client)
    * Linux
        1. Download a Cloudflare binary file from [here](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/installation)
        2. Install a Cloudflare binary file
        3. Put the following in your '/home/"username"/.ssh/config' (requires a text editor like vim or nano)
            ```
            Host *.trycloudflare.com
                HostName %h
                User root
                Port 22
                ProxyCommand <PUT_THE_CLOUDFLARE_FILE_PATH_HERE> access ssh --hostname %h
            ```
            maybe, you need to put following..
            ```
            Host *.trycloudflare.com
                HostName %h
                User root
                Port 22
                ProxyCommand cloudflare access ssh --hostname %h
            ```
    * Mac
        1. Trying the following command(if you had installed 'brew')
            ```
            $ brew install cloudflare
            ```
        2. Same procedure to number 3 step of the linux side
    * Windows
        1. Same procedure to number 1~2 step of the linux side
        2. Put the following in your installed path to ssh config(Same procedure to number 3 step of the linux side, but The path input method is different)
            ```
            Host *.trycloudflare.com
                HostName %h
                User root
                Port 22
                ProxyCommand C:\\cloudflared.exe access ssh --hostname %h
            ```
    * Common(from Server)
        1. Go to the cloud, access the cloud shell and enter the following
            ```
            git clone https://github.com/GabrielKim/ssh_jupyter_init.git
            ```
        2. Connect to jupyter, find the cloned Repository, press init.ipynb, and run it
        3. Look for the following in jupyter's output, and copy that part
            ```
            "<your-connect-path>.trycloudflare.com"
            ```
        4. Do not terminate the session for this "jupyter"!
    * Common
        1. Copy the path from the server and connect with your ssh
        2. When if connecting, the password is 0000.

Enjoy!

## License
The license for that source uses [MIT](./LICENSE).