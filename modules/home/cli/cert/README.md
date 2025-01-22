# cli cert

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
```

## lego

Let's Encrypt client and ACME library written in Go.
[github](https://go-acme.github.io/lego/)
`$ lego --help`

```
NAME:
   lego - Let's Encrypt client written in Go

USAGE:
   lego [global options] command [command options]

VERSION:
   4.19.2

COMMANDS:
   run      Register an account, then create and install a certificate
   revoke   Revoke a certificate
   renew    Renew a certificate
   dnshelp  Shows additional help for the '--dns' global option
   list     Display certificates and accounts information.
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --domains value, -d value [ --domains value, -d value ]      Add a domain to the process. Can be specified multiple times.
   --server value, -s value                                     CA hostname (and optionally :port). The server certificate must be trusted in order to avoid further modifications to the client. (default: "https://acme-v02.api.letsencrypt.org/directory") [$LEGO_SERVER]
   --accept-tos, -a                                             By setting this flag to true you indicate that you accept the current Let's Encrypt terms of service. (default: false)
   --email value, -m value                                      Email used for registration and recovery contact.
   --csr value, -c value                                        Certificate signing request filename, if an external CSR is to be used.
   --eab                                                        Use External Account Binding for account registration. Requires --kid and --hmac. (default: false) [$LEGO_EAB]
   --kid value                                                  Key identifier from External CA. Used for External Account Binding. [$LEGO_EAB_KID]
   --hmac value                                                 MAC key from External CA. Should be in Base64 URL Encoding without padding format. Used for External Account Binding. [$LEGO_EAB_HMAC]
   --key-type value, -k value                                   Key type to use for private keys. Supported: rsa2048, rsa3072, rsa4096, rsa8192, ec256, ec384. (default: "ec256")
   --filename value                                             (deprecated) Filename of the generated certificate.
   --path value                                                 Directory to use for storing the data. (default: "/home/zxc/workspace/snowfall/modules/home/cli/cert/.lego") [$LEGO_PATH]
   --http                                                       Use the HTTP-01 challenge to solve challenges. Can be mixed with other types of challenges. (default: false)
   --http.port value                                            Set the port and interface to use for HTTP-01 based challenges to listen on. Supported: interface:port or :port. (default: ":80")
   --http.proxy-header value                                    Validate against this HTTP header when solving HTTP-01 based challenges behind a reverse proxy. (default: "Host")
   --http.webroot value                                         Set the webroot folder to use for HTTP-01 based challenges to write directly to the .well-known/acme-challenge file. This disables the built-in server and expects the given directory to be publicly served with access to .well-known/acme-challenge
   --http.memcached-host value [ --http.memcached-host value ]  Set the memcached host(s) to use for HTTP-01 based challenges. Challenges will be written to all specified hosts.
   --http.s3-bucket value                                       Set the S3 bucket name to use for HTTP-01 based challenges. Challenges will be written to the S3 bucket.
   --tls                                                        Use the TLS-ALPN-01 challenge to solve challenges. Can be mixed with other types of challenges. (default: false)
   --tls.port value                                             Set the port and interface to use for TLS-ALPN-01 based challenges to listen on. Supported: interface:port or :port. (default: ":443")
   --dns value                                                  Solve a DNS-01 challenge using the specified provider. Can be mixed with other types of challenges. Run 'lego dnshelp' for help on usage.
   --dns.disable-cp                                             (deprecated) use dns.propagation-disable-ans instead. (default: false)
   --dns.propagation-disable-ans                                By setting this flag to true, disables the need to await propagation of the TXT record to all authoritative name servers. (default: false)
   --dns.propagation-rns                                        By setting this flag to true, use all the recursive nameservers to check the propagation of the TXT record. (default: false)
   --dns.propagation-wait value                                 By setting this flag, disables all the propagation checks of the TXT record and uses a wait duration instead. (default: 0s)
   --dns.resolvers value [ --dns.resolvers value ]              Set the resolvers to use for performing (recursive) CNAME resolving and apex domain determination. For DNS-01 challenge verification, the authoritative DNS server is queried directly. Supported: host:port. The default is to use the system resolvers, or Google's DNS resolvers if the system's cannot be determined.
   --http-timeout value                                         Set the HTTP timeout value to a specific value in seconds. (default: 0)
   --dns-timeout value                                          Set the DNS timeout value to a specific value in seconds. Used only when performing authoritative name server queries. (default: 10)
   --pem                                                        Generate an additional .pem (base64) file by concatenating the .key and .crt files together. (default: false)
   --pfx                                                        Generate an additional .pfx (PKCS#12) file by concatenating the .key and .crt and issuer .crt files together. (default: false) [$LEGO_PFX]
   --pfx.pass value                                             The password used to encrypt the .pfx (PCKS#12) file. (default: "changeit") [$LEGO_PFX_PASSWORD]
   --pfx.format value                                           The encoding format to use when encrypting the .pfx (PCKS#12) file. Supported: RC2, DES, SHA256. (default: "RC2") [$LEGO_PFX_FORMAT]
   --cert.timeout value                                         Set the certificate timeout value to a specific value in seconds. Only used when obtaining certificates. (default: 30)
   --overall-request-limit value                                ACME overall requests limit. (default: 18)
   --user-agent value                                           Add to the user-agent sent to the CA to identify an application embedding lego-cli
   --help, -h                                                   show help
   --version, -v                                                print the version
```

```nix tangle:default.nix
      "lego"
```

## mkcert

Simple tool for making locally-trusted development certificates.
[github](https://github.com/FiloSottile/mkcert)
`$ mkcert --help`

```
Usage of mkcert:

	$ mkcert -install
	Install the local CA in the system trust store.

	$ mkcert example.org
	Generate "example.org.pem" and "example.org-key.pem".

	$ mkcert example.com myapp.dev localhost 127.0.0.1 ::1
	Generate "example.com+4.pem" and "example.com+4-key.pem".

	$ mkcert "*.example.it"
	Generate "_wildcard.example.it.pem" and "_wildcard.example.it-key.pem".

	$ mkcert -uninstall
	Uninstall the local CA (but do not delete it).

Advanced options:

	-cert-file FILE, -key-file FILE, -p12-file FILE
	    Customize the output paths.

	-client
	    Generate a certificate for client authentication.

	-ecdsa
	    Generate a certificate with an ECDSA key.

	-pkcs12
	    Generate a ".p12" PKCS #12 file, also know as a ".pfx" file,
	    containing certificate and key for legacy applications.

	-csr CSR
	    Generate a certificate based on the supplied CSR. Conflicts with
	    all other flags and arguments except -install and -cert-file.

	-CAROOT
	    Print the CA certificate and key storage location.

	$CAROOT (environment variable)
	    Set the CA certificate and key storage location. (This allows
	    maintaining multiple local CAs in parallel.)

	$TRUST_STORES (environment variable)
	    A comma-separated list of trust stores to install the local
	    root CA into. Options are: "system", "java" and "nss" (includes
	    Firefox). Autodetected by default.

```

```nix tangle:default.nix
      "mkcert"
      # keep-sorted end
    ];
  }
)
```
