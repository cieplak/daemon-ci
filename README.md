# Daemon CI

Continuous Integration System

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

