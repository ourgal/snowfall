{
  servs.espanso.matches = {
    base = {
      matches = [
        {
          replace = "{{mydate}}";
          trigger = ":date";
          vars = [
            {
              name = "mydate";
              params = {
                format = "%m/%d/%Y";
              };
              type = "date";
            }
          ];
        }
        {
          replace = "{{mydate}}";
          trigger = ":time";
          vars = [
            {
              name = "mydate";
              params = {
                format = "%H:%M";
              };
              type = "date";
            }
          ];
        }
      ];
    };
    calibre = {
      matches = [
        {
          replace = "amazon_jp:{{clipboard}}";
          trigger = ":ajp";
          vars = [
            {
              name = "clipboard";
              type = "clipboard";
            }
          ];
        }
      ];
    };
    default = { };
    git = {
      name = "git";
      parent = "default";
      matches = [
        {
          trigger = "giti.";
          replace = "git init ";
        }
        {
          trigger = "gitcl.";
          replace = "git clone ";
        }
        {
          trigger = "gitcl1.";
          replace = "git clone --depth 1 ";
        }
        {
          trigger = "gitconfigline1.";
          replace = "git config --global core.autocrlf true";
        }
        {
          trigger = "gitconfigline2.";
          replace = "git config --global core.safecrlf warn";
        }
        {
          trigger = "gitemailg.";
          replace = "git config --global user.email \"$|$\"";
        }
        {
          trigger = "gitemaill.";
          replace = "git config --local user.email \"$|$\"";
        }
        {
          trigger = "gituserg.";
          replace = "git config --global user.name \"$|$\"";
        }
        {
          trigger = "gituserl.";
          replace = "git config --local user.name \"$|$\"";
        }
        {
          trigger = "gits.";
          replace = "git status";
        }
        {
          trigger = "gita.";
          replace = "git add .";
        }
        {
          trigger = "gitc.";
          replace = "git commit -m \"$|$\"";
        }
        {
          trigger = "gitcf.";
          replace = "git add . && git commit -m \"feat: $|$\"";
        }
        {
          trigger = "gitcc.";
          replace = "git add . && git commit -m \"chore: $|$\"";
        }
        {
          trigger = "gitcx.";
          replace = "git add . && git commit -m \"fix: $|$\"";
        }
        {
          trigger = "gitcd.";
          replace = "git add . && git commit -m \"docs: $|$\"";
        }
        {
          trigger = "gitcr.";
          replace = "git add . && git commit -m \"refactor: $|$\"";
        }
        {
          trigger = "gitcs.";
          replace = "git add . && git commit -m \"style: $|$\"";
        }
        {
          trigger = "gitct.";
          replace = "git add . && git commit -m \"test: $|$\"";
        }
        {
          trigger = "gitamc.";
          replace = "git commit --amend -m \"$|$\"";
        }
        {
          trigger = "gitcam.";
          replace = "git commit --amend -m \"$|$\"";
        }
        {
          trigger = "gitce.";
          replace = "git commit --amend --no-edit";
        }
        {
          trigger = "gitama.";
          replace = "git commit --amend --author=\"$|$User Name <email@email.com>\"";
        }
        {
          trigger = "gitamd.";
          replace = ''
            #Examples: "2023-02-14T15:55:00" | "Wed Sep 9 22:00 2020 +0530"
            git commit --amend --date=""'';
        }
        {
          trigger = "gitp.";
          replace = "git push origin ";
        }
        {
          trigger = "gitpg.";
          replace = "git push github ";
        }
        {
          trigger = "gitpf.";
          replace = "git push origin --force ";
        }
        {
          trigger = "gitru.";
          replace = "git remote update";
        }
        {
          trigger = "gitfa.";
          replace = "git fetch --all";
        }
        {
          trigger = "gitpd.";
          replace = "git push origin develop";
        }
        {
          trigger = "gitpd1.";
          replace = "git push origin dev";
        }
        {
          trigger = "gitpd2.";
          replace = "git push origin develop";
        }
        {
          trigger = "gitpd3.";
          replace = "git push origin development";
        }
        {
          trigger = "gitph.";
          replace = "git push origin homolog";
        }
        {
          trigger = "gitph1.";
          replace = "git push origin hml";
        }
        {
          trigger = "gitph2.";
          replace = "git push origin homolog";
        }
        {
          trigger = "gitph3.";
          replace = "git push origin homologation";
        }
        {
          trigger = "gitu.";
          replace = "git pull origin ";
        }
        {
          trigger = "gitud.";
          replace = "git pull origin develop";
        }
        {
          trigger = "gitud1.";
          replace = "git pull origin dev";
        }
        {
          trigger = "gitud2.";
          replace = "git pull origin develop";
        }
        {
          trigger = "gitud3.";
          replace = "git pull origin development";
        }
        {
          trigger = "gituh.";
          replace = "git pull origin homolog";
        }
        {
          trigger = "gituh1.";
          replace = "git pull origin hml";
        }
        {
          trigger = "gituh2.";
          replace = "git pull origin homolog";
        }
        {
          trigger = "gituh3.";
          replace = "git pull origin homologation";
        }
        {
          trigger = "gitst.";
          replace = "git stash";
        }
        {
          trigger = "gitstl.";
          replace = "git stash list";
        }
        {
          trigger = "gitsts.";
          replace = "git stash show";
        }
        {
          trigger = "gitstp.";
          replace = "git stash pop";
        }
        {
          trigger = "gitstd.";
          replace = "git stash drop";
        }
        {
          trigger = "gitstiu.";
          replace = "git stash --include-untracked";
        }
        {
          trigger = "gitm.";
          replace = "git merge ";
        }
        {
          trigger = "gitbm.";
          replace = "git branch -m main";
        }
        {
          trigger = "gitmd.";
          replace = "git merge develop";
        }
        {
          trigger = "gitmd1.";
          replace = "git merge dev";
        }
        {
          trigger = "gitmd2.";
          replace = "git merge develop";
        }
        {
          trigger = "gitmd3.";
          replace = "git merge development";
        }
        {
          trigger = "gitmh.";
          replace = "git merge homolog";
        }
        {
          trigger = "gitmh1.";
          replace = "git merge hml";
        }
        {
          trigger = "gitmh2.";
          replace = "git merge homolog";
        }
        {
          trigger = "gitmh3.";
          replace = "git merge homologation";
        }
        {
          trigger = "gitchk.";
          replace = "git checkout ";
        }
        {
          trigger = "gitchkd.";
          replace = "git checkout develop";
        }
        {
          trigger = "gitchkd1.";
          replace = "git checkout dev";
        }
        {
          trigger = "gitchkd2.";
          replace = "git checkout develop";
        }
        {
          trigger = "gitchkd3.";
          replace = "git checkout development";
        }
        {
          trigger = "gitchkh.";
          replace = "git checkout homolog";
        }
        {
          trigger = "gitchkh1.";
          replace = "git checkout hml";
        }
        {
          trigger = "gitchkh2.";
          replace = "git checkout homolog";
        }
        {
          trigger = "gitchkh3.";
          replace = "git checkout homologation";
        }
        {
          trigger = "gitchkb.";
          replace = "git checkout -b ";
        }
        {
          trigger = "gitnb.";
          replace = "git checkout -b ";
        }
        {
          trigger = "gitb.";
          replace = "git branch";
        }
        {
          trigger = "gitba.";
          replace = "git branch -a";
        }
        {
          trigger = "gitbd.";
          replace = "git branch -d ";
        }
        {
          trigger = "gitbdf.";
          replace = "git branch -D ";
        }
        {
          trigger = "gitbdr.";
          replace = "git push origin --delete ";
        }
        {
          trigger = "gitl.";
          replace = "git log";
        }
        {
          trigger = "gitlp.";
          replace = "git log --pretty=oneline";
        }
        {
          trigger = "gitlo.";
          replace = "git log --oneline";
        }
        {
          trigger = "gitlgo.";
          replace = "git log --graph --oneline";
        }
        {
          trigger = "gitlpf.";
          replace = "git log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short";
        }
        {
          trigger = "gitrb.";
          replace = "git rebase main";
        }
        {
          trigger = "gitrba.";
          replace = "git rebase -i --autosquash main";
        }
        {
          trigger = "gitrs.";
          replace = "git reset";
        }
        {
          trigger = "gitrsh.";
          replace = "git reset --hard ";
        }
        {
          trigger = "gitrshh.";
          replace = "git reset --hard HEAD";
        }
        {
          trigger = "gitrshh1.";
          replace = "git reset --hard HEAD~1";
        }
        {
          trigger = "gitrss.";
          replace = "git reset --soft ";
        }
        {
          trigger = "gitrssh.";
          replace = "git reset --soft HEAD";
        }
        {
          trigger = "gitrssh1.";
          replace = "git reset --soft HEAD~1";
        }
        {
          trigger = "gitrv.";
          replace = "git revert HEAD";
        }
        {
          trigger = "gitrvne.";
          replace = "git revert HEAD --no-edit";
        }
        {
          trigger = "gittg.";
          replace = "git tag ";
        }
        {
          trigger = "gittgd.";
          replace = "git tag -d ";
        }
        {
          trigger = "gitmv.";
          replace = "git mv file.ext dir_name";
        }
        {
          trigger = "gitcyp.";
          replace = "git cherry-pick ";
        }
        {
          trigger = "gitrt.";
          replace = "git restore .";
        }
        {
          trigger = "gitcln.";
          replace = "git clean -f";
        }
        {
          trigger = "gitsw.";
          replace = "git switch ";
        }
        {
          trigger = "gitswm.";
          replace = "git switch main";
        }
      ];
    };
    github = {
      matches = [
        {
          replace = "https://github.com/{{clipboard}}";
          trigger = ":gh";
          vars = [
            {
              name = "clipboard";
              type = "clipboard";
            }
          ];
        }
      ];
    };
    markdown = {
      matches = [
        {
          trigger = ":block:";
          label = "Markdown - Code block";
          replace = ''
            ```$|$
            ```'';
          force_clipboard = true;
        }
        {
          trigger = ":code:";
          label = "Markdown - Inline code";
          replace = "`$|$`";
          force_clipboard = false;
        }
        {
          trigger = ":h1:";
          label = "Markdown - Header1";
          replace = "#";
        }
        {
          trigger = ":h2:";
          label = "Markdown - Header2";
          replace = "##";
        }
        {
          trigger = ":h3:";
          label = "Markdown - Header3";
          replace = "###";
        }
        {
          trigger = ":h4:";
          label = "Markdown - Header4";
          replace = "####";
        }
        {
          trigger = ":h5:";
          label = "Markdown - Header5";
          replace = "#####";
        }
        {
          trigger = ":h6:";
          label = "Markdown - Header6";
          replace = "######";
        }
        {
          trigger = ":bold:";
          label = "Markdown - Bold";
          replace = "**$|$**";
        }
        {
          trigger = ":italic:";
          label = "Markdown - Italic";
          replace = "*$|$*";
        }
        {
          trigger = ":strike:";
          label = "Markdown - Strikethrough";
          replace = "~~$|$~~";
        }
        {
          trigger = ":url:";
          label = "Markdown - URL";
          replace = "[$|$]()";
        }
        {
          trigger = ":img:";
          label = "Markdown - Image";
          replace = "![]($|$)";
        }
        {
          trigger = ":horizontal:";
          label = "Markdown - Horizontal line";
          replace = "___";
        }
        {
          trigger = ":task:";
          label = "Markdown - Task";
          replace = "- [ ] ";
        }
        {
          trigger = ":taskdone:";
          label = "Markdown - Task completed";
          replace = "- [x] ";
        }
        {
          trigger = ":collapse:";
          label = "Markdown - Collapse block";
          replace = ''
            <details>
            <summary></summary>
            $|$
            </details>'';
          force_clipboard = true;
        }
        {
          trigger = ":comment:";
          label = "Markdown - Comment";
          replace = "<!--- $|$ -->";
          force_clipboard = true;
        }
      ];
    };
    translate = {
      matches = [
        {
          replace = "trans -t en -p ";
          trigger = ":tre";
        }
        {
          replace = "trans -t zh -p ";
          trigger = ":trz";
        }
      ];
    };
  };
}
