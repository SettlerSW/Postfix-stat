#!/bin/bash

date_debut=$( date -d "-$1 minutes" +"%b %d %H:%M:%S" )
date_fin=$( date +"%b %d %H:%M:%S" )
log_path="/var/log/mail.log"
tmp_file="/tmp/tmpmail.log"

awk '$0>=from&&$0<=to' from="$date_debut" to="$date_fin" $log_path > $tmp_file

#echo $(grep "status=sent" $tmp_file | wc -l) mail sent
#echo $(grep "status=deferred" $tmp_file | wc -l) mail deferred
#echo $(grep "status=bounced" $tmp_file | wc -l) mail bounced
#echo $(grep "status=expired" $tmp_file | wc -l) mail expired

echo -n "<prtg>
    <result>
        <channel>Sent</channel>
        <value>$(grep "status=sent" $tmp_file | wc -l)</value>
    </result>
    <result>
        <channel>Deffered</channel>
        <value>$(grep "status=deferred" $tmp_file | wc -l)</value>
    </result>
    <result>
        <channel>Bounced</channel>
        <value>$(grep "status=bounced" $tmp_file | wc -l)</value>
    </result>
    <result>
        <channel>Expired</channel>
        <value>$(grep "status=expired" $tmp_file | wc -l)</value>
    </result>
</prtg>"
