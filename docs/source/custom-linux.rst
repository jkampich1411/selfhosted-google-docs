Installing on custom hardware (Linux)
=====================================

.. note::

    This guide is not finished yet! Check back later.

.. warning::
    **DO NOT DO THIS ON YOUR MAIN COMPUTER**

    **THIS SHOULD BE PERFORMED ON THE HARDWARE THAT WILL BE TURNED INTO YOUR SERVER**

    **DOING THIS WILL OVERWRITE EVERYTHING STORED ON THAT HARDWARE**

    **DO NOT DO THIS ON YOUR MAIN COMPUTER**

Install Debian
--------------

.. note::
    This step is very complicated and can often lead to errors.

    If you are unsure about any step, don't hesitate to ask in the `Discord <>`_!

First, download the `Debian installer <https://www.debian.org/download>`_.

*(The link on the page to download the installer looks like this: "debian-XX.X.X-amd64-netinst.iso")*

Then, burn it onto a USB using `Rufus <https://www.uubyte.com/how-to-use-rufus.html#4>`_.

Restart your device and boot from the USB Drive.

*(This varies from manufacturer to manufacturer, google "How to enter boot menu on [Device Manufacturer], [Device Model]")*

Once you did that, `here <https://youtu.be/gddlhr9ST9Y?t=132>`_'s a tutorial on how to install Debian once you are in the installer.

When partitioning the drives, setup your external storage under the "/mnt/storage" path.

When asked, **enable** "SSH Server".


Setup Tailscale
---------------

You should now be in the Debian Environment.

1. Click "Activities" and open Firefox.
2. Open the Tailscale Page (`https://tailscale.com <https://tailscale.com>`_) and press "Log in".
3. Login with your desired Identity Provider.
4. Click "I'm already familiar with tailscale, skip" (grey text in the bottom of the Setup window).

.. image:: ./images/tailscale-admin.png
   :width: 800px

5. Press on "Activities", search for "Terminal" and open it.
6. Type in ``su``, press Enter and type in the **ROOT** password you set earlier.
7. Run this command: ``apt-get update && apt-get upgrade -y && apt-get install curl snapd git``
8. Run this command: ``curl -fsSL https://tailscale.com/install.sh | sh``
9. Run this command: ``tailscale up``

Now get back to Firefox
                            
10. Using the three dots, rename the device that hosts your NextCloud to something you can easily remember, plain "nextcloud" for example. **DON'T name it something that can personally identify you, like your first and last name / address / etc.**
11. Click on the three dots, and then press on "Disable key expiry" and confirm if necessary.
12. If your main device contains something, that can personally identify you, rename it as well.
13. Navigate to the DNS page. It should look like this:

.. image:: ./images/tailscale-dns.png
   :width: 800px

14. Press "Rename tailnet..."
15. A box should pop up that looks like this:

.. image:: ./images/tailscale-rename.png
   :width: 400px

16. You now have 4 options of how your network will be named. If you don't like any of them, press "Re-roll options". If you find one you like, choose it and press "Rename tailnet"
17. Scroll down to the very bottom and click "Enable HTTPS..." and in the dialogue, click "Enable".

Continue with the next step!


Install NextCloud
-----------------

