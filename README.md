# patchdashboard-cookbook

Allows you to deploy Patch Dashboard via Chef, as well as use test kitchen to build out a test vagrant box.

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
    <td><tt>['patchdashboard']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
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

Author:: YOUR_NAME (<YOUR_EMAIL>)
