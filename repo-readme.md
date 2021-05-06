
  [![Build](https://img.shields.io/buildkite/d6543d3ece3433f46dbe5fd9fcfaf1f68a6dbc48eb1048bc22/master?logo=buildkite&style=flat-square&color=brightgreen)](https://buildkite.com/authelia/authelia)
  [![Go Report Card](https://goreportcard.com/badge/github.com/authelia/authelia?logo=go&style=flat-square)](https://goreportcard.com/report/github.com/authelia/authelia)
  [![Docker Tag](https://img.shields.io/docker/v/authelia/authelia/latest?logo=docker&style=flat-square&color=blue&sort=semver)](https://microbadger.com/images/authelia/authelia)
  [![Docker Size](https://img.shields.io/docker/image-size/authelia/authelia/latest?logo=docker&style=flat-square&color=blue&sort=semver)](https://hub.docker.com/r/authelia/authelia/tags)
  [![GitHub Release](https://img.shields.io/github/release/authelia/authelia.svg?logo=github&style=flat-square&color=blue)](https://github.com/authelia/authelia/releases)
  [![AUR source version](https://img.shields.io/aur/version/authelia?logo=arch-linux&label=authelia&style=flat-square&color=blue)](https://aur.archlinux.org/packages/authelia/)
  [![AUR binary version](https://img.shields.io/aur/version/authelia-bin?logo=arch-linux&label=authelia-bin&style=flat-square&color=blue)](https://aur.archlinux.org/packages/authelia-bin/)
  [![AUR development version](https://img.shields.io/aur/version/authelia-git?logo=arch-linux&label=authelia-git&style=flat-square&color=blue)](https://aur.archlinux.org/packages/authelia-git/)
  [![License](https://img.shields.io/github/license/authelia/authelia?logo=apache&style=flat-square&color=blue)][Apache 2.0]
  [![Sponsor](https://img.shields.io/opencollective/all/authelia-sponsors?logo=Open%20Collective&label=financial%20contributors&style=flat-square&color=blue)](https://opencollective.com/authelia-sponsors)
  [![Discord](https://img.shields.io/discord/707844280412012608?label=discord&logo=discord&style=flat-square&color=blue)](https://discord.authelia.com)
  [![Matrix](https://img.shields.io/matrix/authelia:matrix.org?label=matrix&logo=matrix&style=flat-square&color=blue)](https://riot.im/app/#/room/#authelia:matrix.org)

**Authelia** is an open-source authentication and authorization server providing 2-factor authentication and single 
sign-on (SSO) for your applications via a web portal. It acts as a companion of reverse proxies like [nginx], [Traefik] 
or [HAProxy] to let them know whether queries should pass through. Unauthenticated users are redirected to Authelia 
Sign-in portal instead.

Documentation is available at https://www.authelia.com/docs.

The architecture is shown in the diagram below.

**Authelia** can be installed as a standalone service from the [AUR](https://aur.archlinux.org/packages/authelia/), 
[FreeBSD Ports](https://svnweb.freebsd.org/ports/head/www/authelia/), or using a 
[Static binary](https://github.com/authelia/authelia/releases/latest), [Docker] or [Kubernetes] leveraging ingress 
controllers and ingress configurations. Assistance to publish a 
[Debian package](https://github.com/authelia/authelia/issues/573) would be greatly appreciated.

## Features summary

Here is the list of the main available features:

* Several second factor methods:
  * **[Security Key (U2F)](https://www.authelia.com/docs/features/2fa/security-key)** with [Yubikey].
  * **[Time-based One-Time password](https://www.authelia.com/docs/features/2fa/one-time-password)** 
    with [Google Authenticator].
  * **[Mobile Push Notifications](https://www.authelia.com/docs/features/2fa/push-notifications)** 
    with [Duo](https://duo.com/).
* Password reset with identity verification using email confirmation.
* Single-factor only authentication method available.
* Access restriction after too many authentication attempts.
* Fine-grained access control per subdomain, user, resource and network.
* Support of basic authentication for endpoints protected by single factor.
* Beta support for [OpenID Connect](https://www.authelia.com/docs/configuration/identity-providers/oidc.html).
* Highly available using a remote database and Redis as a highly available KV store.
* Compatible with Kubernetes [ingress-nginx](https://github.com/kubernetes/ingress-nginx) controller out of the box.

For more details about the features, follow [Features](https://www.authelia.com/docs/features/).

If you want to know more about the roadmap, follow [Roadmap](https://www.authelia.com/docs/roadmap).

## Proxy support

Authelia works in combination with [nginx], [Traefik] or [HAProxy]. It can be deployed on bare metal with
Docker or on top of [Kubernetes].

## Getting Started

You can start utilising Authelia with the provided `docker-compose` bundles:

#### [Local](https://www.authelia.com/docs/getting-started)
The Local compose bundle is intended to test Authelia without worrying about configuration.
It's meant to be used for scenarios where the server is not be exposed to the internet.
Domains will be defined in the local hosts file and self-signed certificates will be utilised.

#### [Lite](https://www.authelia.com/docs/deployment/deployment-lite)
The Lite compose bundle is intended for scenarios where the server will be exposed to the internet, domains and DNS will 
need to be setup accordingly and certificates will be generated through LetsEncrypt. The Lite element refers to minimal 
external dependencies; File based user storage, SQLite based configuration storage. In this configuration, the service 
will not scale well.

#### [Full](https://www.authelia.com/docs/deployment/deployment-ha)
The Full compose bundle is intended for scenarios where the server will be exposed to the internet, domains and DNS will 
need to be setup accordingly and certificates will be generated through LetsEncrypt. The Full element refers to a 
scalable setup which includes external dependencies; LDAP based user storage, Database based configuration storage 
(MariaDB, MySQL or Postgres). 

## Deployment

Now that you have tested **Authelia** and you want to try it out in your own infrastructure,
you can learn how to deploy and use it with [Deployment](https://www.authelia.com/docs/deployment/deployment-ha).
This guide will show you how to deploy it on bare metal as well as on
[Kubernetes](https://kubernetes.io/).

## Security

Authelia takes security very seriously. We follow the rule of
[responsible disclosure](https://en.wikipedia.org/wiki/Responsible_disclosure), and we
encourage the community to as well.

If you discover a vulnerability in Authelia, please first contact one of the maintainers privately
either via [Matrix](#matrix) or [email](#email) as described in the [contact options](#contact-options) below.

For details about security measures implemented in Authelia, please follow
this [link](https://www.authelia.com/docs/security/measures.html) and for reading about 
the threat model follow this [link](https://www.authelia.com/docs/security/threat-model.html).

### Contact Options

#### Matrix

Join the [Matrix Room](https://riot.im/app/#/room/#authelia:matrix.org) and locate one of the maintainers.
You can identify them as they are the room administrators. Alternatively you can just ask for one of the
maintainers. Once you've made contact we ask you privately message the maintainer to communicate the vulnerability.

#### Discord

Join the [Discord Server](https://discord.authelia.com) and message the
[#support](https://discord.com/channels/707844280412012608/707844280412012612) chat which links to [Matrix](#matrix) 
and contact a maintainer. 

#### Email

You can contact any of the maintainers for security vulnerability related issues by emailing 
[security@authelia.com](mailto:security@authelia.com). This email is strictly reserved for security and vulnerability
disclosure related matters. If you need to contact us for another reason please use [Matrix](#matrix) or
[team@authelia.com](mailto:team@authelia.com).

## Breaking changes

Since Authelia is still under active development, it is subject to breaking changes. It's recommended to pin a version 
tag instead of using the `latest` tag and reading the [release notes](https://github.com/authelia/authelia/releases) 
before upgrading. This is where you will find information about breaking changes and what you should do to overcome 
said changes.

## Why Open Source?

You might wonder why Authelia is open source while it adds a great deal of security and user experience to your 
infrastructure at zero cost. It is open source because we firmly believe that security should be available for all to 
benefit in the face of the battlefield which is the Internet, with near zero effort.

Additionally, keeping the code open source is a way to leave it auditable by anyone who is willing to contribute. This 
way, you can be confident that the product remains secure and does not act maliciously.

It's important to keep in mind Authelia is not directly exposed on the
Internet (your reverse proxies are) however, it's still the control plane for your internal security so take care of it!

## License

**Authelia** is **licensed** under the **[Apache 2.0]** license. The terms of the license are detailed 
in [LICENSE](./LICENSE).

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fauthelia%2Fauthelia.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fauthelia%2Fauthelia?ref=badge_large)


[Apache 2.0]: https://www.apache.org/licenses/LICENSE-2.0
[TOTP]: https://en.wikipedia.org/wiki/Time-based_One-time_Password_Algorithm
[Security Key]: https://www.yubico.com/about/background/fido/
[Yubikey]: https://www.yubico.com/products/yubikey-hardware/yubikey4/
[auth_request]: https://nginx.org/en/docs/http/ngx_http_auth_request_module.html
[Google Authenticator]: https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=en
[nginx]: https://www.nginx.com/
[Traefik]: https://traefik.io/
[HAProxy]: https://www.haproxy.org/
[Docker]: https://docker.com/
[Kubernetes]: https://kubernetes.io/
