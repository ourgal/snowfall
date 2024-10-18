args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "oneshot";
    confs = {
      "oneshot/config.yaml" = builtins.toJSON {
        basicauth = {
          nodialog = false;
          password = "";
          passwordfile = "";
          passwordprompt = false;
          unauthorizedpage = "";
          unauthorizedstatus = 401;
          username = "";
        };
        cmd = {
          discoveryserver = {
            jwt = {
              key = "";
              value = "";
            };
            maxqueuesize = 0;
            requiredkey = {
              path = "";
              value = "";
            };
            server = {
              addr = "";
              tlscert = "";
              tlskey = "";
            };
            urlassignment = {
              domain = "";
              path = "";
              pathprefix = "";
              port = "";
              scheme = "";
            };
          };
          exec = {
            dir = "";
            enforcecgi = false;
            env = [ ];
            headers = { };
            replaceheaders = false;
            stderr = "";
          };
          p2p = {
            browserclient = {
              open = false;
            };
            client = {
              send = {
                archivemethod = "";
                name = "";
              };
            };
          };
          receive = {
            csrftoken = "";
            decodeb64 = false;
            eol = "";
            header = { };
            includebody = false;
            status = 200;
            uifile = "";
          };
          redirect = {
            header = { };
            status = 307;
          };
          rproxy = {
            matchhost = false;
            method = "";
            requestheader = { };
            responseheader = { };
            spoofhost = "";
            status = 0;
            tee = false;
          };
          send = {
            archivemethod = "tar.gz";
            header = { };
            mime = "";
            name = "";
            nodownload = false;
            statuscode = 200;
          };
        };
        cors = {
          allowcredentials = false;
          allowedheaders = [ ];
          allowedorigins = [ ];
          allowprivatenetwork = false;
          maxage = 0;
          successstatus = 204;
        };
        discovery = {
          enabled = true;
          host = "";
          insecure = false;
          key = "";
          keypath = "";
          onlyredirect = false;
          preferredurl = "";
          reports = {
            enabled = true;
            headerfilter = {
              allow = [ ];
              block = [ ];
              usedefaults = true;
            };
          };
          requiredurl = "";
        };
        nattraversal = {
          p2p = {
            discoverydir = "";
            enabled = false;
            icegathertimeout = "30s";
            only = false;
            webrtcconfiguration = [ ];
            webrtcconfigurationfile = "";
          };
          upnp = {
            duration = "0s";
            enabled = false;
            externalport = 0;
            timeout = "1m0s";
          };
        };
        output = {
          format = "";
          nocolor = false;
          qrcode = true;
          quiet = false;
        };
        server = {
          allowbots = false;
          exitonfail = "0";
          host = "";
          maxreadsize = "0";
          port = 8080;
          timeout = "0s";
          tlscert = "";
          tlskey = "";
        };
      };
    };
  }
)
