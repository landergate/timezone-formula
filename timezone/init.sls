{% if grains['os_family']=="Debian" %}

{% if pillar['timezone'] and salt['file.file_exists']("/etc/timezone") %}
/etc/timezone:
  file.managed:
    - contents_pillar: timezone

Readjust time zone:
  cmd.wait:
    - name: dpkg-reconfigure -f noninteractive tzdata
    - watch:
      - file: /etc/timezone
{% endif %}

{% endif %}
