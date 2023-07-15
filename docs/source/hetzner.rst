Installing on Hetzner
=======================

.. note::

    This guide is not finished yet! Check back later.

Costs Breakdown
---------------
In the short-term, this is the cheapest option. If you leave this running for long, costs add up though. If you want a long-term cheaper solution, check out (:doc:`raspberrypi`).

For Hetzner, you need to pay every month, for a Server and a Storage Box. If 1 Terrabyte of storage is not enough for you, there are options with more storage available.

+------------------------------------------------------------+--------------+
| Name                                                       | Monthly Cost |
+============================================================+==============+
| (Recommended) Hetzner Server - CPX21                       | 9,06 €       |
+------------------------------------------------------------+--------------+
| (Optional, but also recommended) Hetzner Storage Box - 1TB | 3,18 €       |
+------------------------------------------------------------+--------------+
| Total                                                      | 12,24 €      |
+------------------------------------------------------------+--------------+

Prerequisites
-------------

* A Hetzner Account - sign up for one `here <https://hetzner.cloud/?ref=wjLCzEGwZOZf">`_!
* A DuckDNS Account - log in with your Google / GitHub account `here <https://www.duckdns.org`_!

.. warning::
    According to `Hetzners Terms of Service <https://www.hetzner.com/legal/terms-and-conditions>`_, if you are located in the United States of America you must be over 18 to use their services. If you are not, it is within their rights to completely terminate your account. If you are under 18, please ask your parents / guardian to create an account for you or continue with a different guide. Recommended: (:doc:`raspberrypi`)

.. warning::
    According to `DuckDNSs Terms of Service <https://www.duckdns.org/tac.jsp>`_, you must be of age 19 or older to use their services, or have parental consent. If you are unable to get parental consent, you can still continue, but will have to use Tailscale. You will find more information about this later in this guide.

.. info::
    You unfortunately can't use DuckDNS with just a E-Mail and a Password. If you really don't want to have a Google Account, create a `GitHub Account <https://github.com>`_ and log in with that one.



curl -sSL "https://prev.jkdev.run/do3-ddns-h" | bash -s
