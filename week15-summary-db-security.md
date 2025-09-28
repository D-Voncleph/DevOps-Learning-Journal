## Week 15 Summary: Database Isolation in a Private Subnet

This week, my learning about AWS VPCs (Virtual Private Clouds) highlighted a critical security best practice: placing sensitive resources, like databases, in a private subnet.

The primary reason for this is absolute security and isolation:

    No Internet Gateway (No Front Door): A private subnet is defined as a subnet that does not have a route to the Internet Gateway (0.0.0.0/0). This means that there is no direct path for any unsolicited inbound traffic from the public internet to reach the resources inside. It's like building a secure vault with no public entrance.

    Principle of Least Privilege: My database holds sensitive information (like user data and application transactions). According to the Principle of Least Privilege, the database should only be accessible by the resources that absolutely need to talk to it—namely, the application servers (which live in the public subnet).

    Layered Defense: By isolating the database in a private subnet, I create a layered defense system. Any external request must first pass through:

        The Internet Gateway.

        The Application Server (which can inspect the request).

        The Security Group of the database.

If the database were placed in a public subnet, it would be unnecessarily exposed to all internet scanners and potential threats. The private subnet ensures that the only way to reach the database is through the controlled, secure channels established by my own application.