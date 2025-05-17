pragma foreign_keys
= on
;

CREATE TABLE waiting_status (
    id integer PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE categories (
    id integer PRIMARY KEY,
    name text NOT NULL
);


CREATE TABLE packages (
    id integer PRIMARY KEY,
    name text NOT NULL,
    description text NOT NULL,
    url text NOT NULL,
    categories integer NOT NULL,
    waiting_status integer NOT NULL,
    added_date text NOT NULL,
    finished_date text,
    FOREIGN KEY (waiting_status)
    REFERENCES waiting_status (id)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
    FOREIGN KEY (categories)
    REFERENCES categories (id)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);

INSERT INTO waiting_status  VALUES (1,'waiting'), (2,'done');

INSERT INTO categories  VALUES
(1,'music'),
(2,'nix'),
(3,'shell'),
(4,'dev'),
(5,'system'),
(6,'git'),
(7,'web'),
(8,'network'),
(9,'docker'),
(10,'audio'),
(11,'share'),
(12,'doc'),
(13,'image'),
(14,'encrypt');

INSERT INTO
packages (name,description,url,categories,added_date,finished_date,waiting_status)
VALUES
('id3',
'ID3 mass tagger',
'https://github.com/squell/id3',1,'05/17/2025',null,1),
('nix-editor',
'A simple rust program to edit NixOS configuration files with just a command',
'https://github.com/snowfallorg/nix-editor',2,'05/17/2025',null,1),
('jumper',
'Accurate and fast files/directories jumper',
'https://github.com/homerours/jumper',3,'05/17/2025',null,1),
('schemat',
'Code formatter for Scheme, Lisp, and any S-expressions',
'https://github.com/raviqqe/schemat',4,'05/17/2025',null,1),
('keyviz',
'Keyviz is a free and open-source tool to visualize your keystrokes ⌨️ and 🖱️ mouse actions in real-time.',
'https://github.com/mulaRahul/keyviz',5,'05/17/2025',null,1),
('git-pr',
'the easiest git collaboration tool',
'https://github.com/picosh/git-pr',6,'05/17/2025',null,1),
('git-pr',
'the easiest git collaboration tool',
'https://github.com/picosh/git-pr',6,'05/17/2025',null,1),
('cvtek',
'📄 Craft your Resume/CV using TOML',
'https://github.com/varbhat/cvtek',7,'05/17/2025',null,1),
('aicommit2',
'A Reactive CLI that generates git commit messages with Ollama, ChatGPT, Gemini, Claude, Mistral and other AI',
'https://github.com/tak-bro/aicommit2',6,'05/17/2025',null,1),
('AngryOxide',
'802.11 Attack Tool',
'https://github.com/Ragnt/AngryOxide',8,'05/17/2025',null,1),
('ducker',
'A slightly quackers Docker TUI based on k9s 🦆',
'https://github.com/robertpsoane/ducker',9,'05/17/2025',null,1),
('simplemoji',
'Fast Application for look your amazing emojis write in Rust',
'https://github.com/SergioRibera/simplemoji',3,'05/17/2025',null,1),
('voicevox',
'無料で使える中品質なテキスト読み上げ・歌声合成ソフトウェア',
'https://voicevox.hiroshiba.jp/',10,'05/17/2025',null,1),
('otree',
'A command line tool to view objects (JSON/YAML/TOML) in TUI tree widget.',
'https://github.com/fioncat/otree',4,'05/17/2025',null,1),
('azote',
'Wallpaper manager for wlroots-based compositors and some other WMs',
'https://github.com/nwg-piotr/azote',5,'05/17/2025',null,1),
('cloudpan189-go',
'天翼云盘命令行客户端(CLI)，基于 GO 语言实现',
'https://github.com/tickstep/cloudpan189-go',11,'05/17/2025',null,1),
('cppman',
'C++ 98/11/14 manual pages for Linux/MacOS',
'https://github.com/aitjcize/cppman',12,'05/17/2025',null,1),
('split-monitor-workspaces',
'A small Hyprland plugin to provide awesome-like workspace behavior',
'https://github.com/Duckonaut/split-monitor-workspaces',5,'05/17/2025',null,1),
('sss',
'SSS (Super ScreenShot) is a WIP: CLI/Lib to take amazing screenshot of code or screen',
'https://github.com/SergioRibera/sss',13,'05/17/2025',null,1),
('Diagon',
'Interactive ASCII art diagram generators. 🌟',
'https://github.com/ArthurSonzogni/Diagon',3,'05/17/2025',null,1),
('Kryptor',
'A simple, modern, and secure encryption and signing tool that aims to be a better version of age and Minisign.',
'https://github.com/samuel-lucas6/Kryptor',14,'05/17/2025',null,1),
('gfie',
'Greenfish Icon Editor Pro (GFIE Pro) is a powerful freeware image editor, especially suitable for creating icons, cursors, animations and icon libraries.',
'http://greenfishsoftware.org/gfie.php',13,'05/17/2025',null,1),
('scooter',
'Interactive find and replace in the terminal',
'https://github.com/thomasschafer/scooter',5,'05/17/2025',null,1),
('deskflow',
'Deskflow lets you share one mouse and keyboard between multiple computers on Windows, macOS and Linux. Its like a software KVM (but without video).',
'https://github.com/deskflow/deskflow',5,'05/17/2025',null,1),
('lla',
'blazing fast `ls` replacement with superpowers',
'https://github.com/triyanox/lla',3,'05/17/2025',null,1),
('ahoy',
'Create self-documenting cli programs from YAML files. Easily wrap bash, grunt, npm, docker, (anything) to standardize your processes and make the lives of the people working on your project better.',
'https://github.com/ahoy-cli/ahoy',3,'05/17/2025',null,1),
('textidote',
'Spelling, grammar and style checking on LaTeX documents',
'https://github.com/sylvainhalle/textidote',12,'05/17/2025',null,1);
