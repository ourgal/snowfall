(var ss_index nil)
(let [fs (require :gears.filesystem)
      dir (fs.get_configuration_dir)
      file (.. dir :ss_index.txt)]
  (if (fs.file_readable file)
      (with-open [f (io.open file)]
        (set ss_index (f:read)))
      (with-open [f (io.open file :w)]
        (f:write 1))))

{: ss_index}
