# Daemon CI

Continuous Integration System, optimized for building, testing and
deploying software on FreeBSD-based systems

## Project Roadmap

### Bootstrap CI

- [ ] Daemon CI should be tested and packaged
      by a Daemon CI host, which deploys itself

### Repo-Level Configuration

- [ ] $project/.daemonci/

### HTTP API

- [ ] /repos
- [ ] /webhooks

- [ ] /builds
- [ ] /artifacts

- [ ] /deploys
- [ ] /hosts

- [ ] /users
- [ ] /notifications

### Github Integration

- [ ] Update Github PR Status

### Web-Based User Interface

- [ ] API-driven authentication & authorization
- [ ] Webhook-based streaming build logs (like `tail -F` in the browser)
- [ ] Views for all API resources
- [ ] CI Statistics View
- [ ] Audit View

### System Administration

- [ ] Extremely minimal configuration, less rope
- [ ] Single command to provision a FreeBSD machine on a cloud provider
- [ ] Single command to bootstrap the machine as a Daemon CI server
- [ ] Minimize moving parts to Postgres, Redis and API server
- [ ] AWS integration
- [ ] Azure integration
- [ ] DO integration
- [ ] GCP integration

### Documentation

- [ ] on github
- [ ] on daemonci.com
- [ ] Sysadmin resources for configuring compliance policies

### Branding

- [ ] Logo
- [ ] daemonci.com

### Explore Plugin Architecture and Platform Possibilities

- [ ] Shareable pipelines
- [ ] Reusable zero-downtime deployment strategies

## Fun Facts About FreeBSD

Netflix streams content from bare metal FreeBSD servers. Their control
plane is hosted by providers such as AWS, but their data plane
operates on Open Connect Appliances running FreeBSD.

Unlike other operating systems (Linux), FreeBSD is distributed with a
permissive open-source license. Restrictive open-source licenses such
as the GPL restrict users of covered code from releasing derivative
works under different license terms. In this regard, FreeBSD is very
business-friendly.

## Fun Facts About Jails

FreeBSD Jails are a mature, stable operating system-level
virtualization technology designed to improve security and simplicity
of system administration. Jails were introduced in 2000.

Using ZFS, individual Jails can be snapshotted, versioned, archived
and deployed to other servers.

## Fun Facts About ZFS

> ZFS is significantly different from any previous file system because
> it is more than just a file system. Combining the traditionally
> separate roles of volume manager and file system provides ZFS with
> unique advantages. The file system is now aware of the underlying
> structure of the disks. Traditional file systems could only be created
> on a single disk at a time. If there were two disks then two separate
> file systems would have to be created. In a traditional hardware RAID
> configuration, this problem was avoided by presenting the operating
> system with a single logical disk made up of the space provided by a
> number of physical disks, on top of which the operating system placed
> a file system. Even in the case of software RAID solutions like those
> provided by GEOM, the UFS file system living on top of the RAID
> transform believed that it was dealing with a single device. ZFS's
> combination of the volume manager and the file system solves this and
> allows the creation of many file systems all sharing a pool of
> available storage. One of the biggest advantages to ZFS's awareness of
> the physical layout of the disks is that existing file systems can be
> grown automatically when additional disks are added to the pool. This
> new space is then made available to all of the file systems. ZFS also
> has a number of different properties that can be applied to each file
> system, giving many advantages to creating a number of different file
> systems and datasets rather than a single monolithic file system.

*Excerpt from* https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/zfs.html#zfs-differences

## Further Reading

### The FreeBSD Handbook

https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/

### The FreeBSD Developers' Handbook

https://www.freebsd.org/doc/en_US.ISO8859-1/books/developers-handbook/

### Serving 100 Gbps from an Open Connect Appliance

https://medium.com/netflix-techblog/serving-100-gbps-from-an-open-connect-appliance-cdb51dda3b99a
