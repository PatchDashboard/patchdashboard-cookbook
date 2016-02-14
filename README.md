# patchdashboard-cookbook

Allows you to deploy Patch Dashboard via Chef, as well as use test kitchen to build out a test vagrant box.

##### This is a work in progress, and should not currently be used.

## Supported Platforms

* Ubuntu 14.04+
* CentOS/RHEL 7+

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['patchdashboard']['salt']</tt></td>
    <td>string</td>
    <td>The servers salt to use in hashing</td>
    <td><tt>&nbsp</tt></td>
  </tr>
  <tr>
    <td><tt>['patchdashboard']['company_name']</tt></td>
    <td>string</td>
    <td>The name of your company</td>
    <td><tt>Your Company, INC</tt></td>
  </tr>
  <tr>
    <td><tt>['patchdashboard']['mysql']['host']</tt></td>
    <td>string</td>
    <td>The Host name/IP address of your MySQL server. If set to localhost/127.0.0.1, it will install MySQL</td>
    <td><tt>localhost</tt></td>
  </tr>
  <tr>
    <td><tt>['patchdashboard']['mysql']['port']</tt></td>
    <td>integer</td>
    <td>The port number for your MySQL installation</td>
    <td><tt>3306</tt></td>
  </tr>
  <tr>
    <td><tt>['patchdashboard']['mysql']['root_pass']</tt></td>
    <td>string</td>
    <td>The password for your MySQL root user</td>
    <td><tt>vagrant</tt></td>
  </tr>
  <tr>
    <td><tt>['patchdashboard']['mysql']['db_user']</tt></td>
    <td>string</td>
    <td>The username to use for the application to log in to MySQL as</td>
    <td><tt>pdb</tt></td>
  </tr>
  <tr>
    <td><tt>['patchdashboard']['mysql']['db_pass']</tt></td>
    <td>string</td>
    <td>The password for the `db_user` to log in with</td>
    <td><tt>vagrant</tt></td>
  </tr>
  <tr>
    <td><tt>['patchdashboard']['mysql']['database']</tt></td>
    <td>string</td>
    <td>MySQL database name to use</td>
    <td><tt>pdb</tt></td>
  </tr>
  <tr>
    <td><tt>['patchdashboard']['apache']['path']</tt></td>
    <td>string</td>
    <td>Path to use for the web UI, without trailing slash</td>
    <td><tt>/var/www/patchmd</tt></td>
  </tr>
  <tr>
    <td><tt>['patchdashboard']['apache']['use_ssl']</tt></td>
    <td>boolean</td>
    <td>If set to true, it will create a self-signed certificate for the application to use</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['patchdashboard']['apache']['http_port']</tt></td>
    <td>integer</td>
    <td>port for non-secure HTTP traffic</td>
    <td><tt>80</tt></td>
  </tr>
  <tr>
    <td><tt>['patchdashboard']['apache']['https_port']</tt></td>
    <td>integer</td>
    <td>port for secure HTTPS traffic</td>
    <td><tt>443</tt></td>
  </tr>
  <tr>
    <td><tt>['patchdashboard']['apache']['host']</tt></td>
    <td>string</td>
    <td>host name for the Apache Virtual Host to use</td>
    <td><tt>patchdashboard.local</tt></td>
  </tr>
</table>

## Usage

### patchdashboard::default

Include `patchdashboard` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[patchdashboard::default]"
  ]
}
```

## License and Authors

Author:: [Jon Harris](https://github.com/jonsjava)
