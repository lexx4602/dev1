----
--- Таблица Server, IP, Host
---
SELECT
  servers.servername,
  ipaddress.ip,
  hosts.hostname
FROM servers
  INNER JOIN hostskey
    ON hostskey.server_id = servers.id
  CROSS JOIN ipaddress
  INNER JOIN ipkey
    ON ipaddress.id = ipkey.ip_id
    AND ipkey.host_id = hostskey.host_id
  INNER JOIN hosts
    ON hostskey.host_id = hosts.host_id
WHERE servers.servername LIKE 'front-nginx'
--------------------------------------------


SELECT
  servers.servername,
  ipaddress.ip,
  hosts.hostname
FROM servers
  INNER JOIN hostskey
    ON hostskey.server_id = servers.id
  CROSS JOIN ipaddress
  INNER JOIN ipkey
    ON ipaddress.id = ipkey.ip_id
    AND ipkey.host_id = hostskey.host_id
  INNER JOIN hosts
    ON hostskey.host_id = hosts.host_id
WHERE ipaddress.ip LIKE '%172%'