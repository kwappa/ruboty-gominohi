# Ruboty::Gominohi

[ruboty](https://github.com/r7kamura/ruboty) plugin that tells garbage collection day

## Install

- put `.gominohi.yml` on...
    - root directory of this gem
    - root directory of your ruboty
    - see bundled `.gominohi.yml.sample`

## Usage

- `ruboty gominohi`
    - notify garbage collection of current day
- better to use with `ruboty-cron`
  - e.g) `ruboty add job "30 7 * * *" ruboty gominohi`

### `.gominohi.yml`

- `version`
    - specify version of this file
    - compared between app's version
        - must be same major and minor version (patch version is ignored)
- `garbage_collectiors`
    - specify member names to send notification (optional)
- `garbage_collection_days`
    - specify days of collect some garbages
        - `wday` : array of wday (1 : Monday)
        - `emoticon` : used as prefix
        - `position` : if specified, show only `n`th wday
            - e.g `wday: [4] position: [2, 4]` : notifies on 2nd and 4th Thursday

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
