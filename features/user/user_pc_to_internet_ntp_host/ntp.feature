Feature: NTP で時刻を同期

  開発者として、
  インターネット上の NTP サーバを使って自分の PC の時刻を同期したい
  なぜなら時刻がばらばらだと make などの開発ツールがうまく動かないから

  Scenario: NTP サーバと時刻を同期 (UDP)
    Given 社内 PC
    And インターネット上の NTP サーバ
    When 社内 PC にログイン
    And 時刻をインターネット上の NTP サーバと同期 (UDP)
    Then 時刻の同期に成功

  Scenario: NTP サーバと時刻を同期 (TCP)
    Given 社内 PC
    And インターネット上の NTP サーバ
    When 社内 PC にログイン
    And 時刻をインターネット上の NTP サーバと同期 (TCP)
    Then 時刻の同期に成功
