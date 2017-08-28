# Postfix-stat
Display some stat from mail.log for monitoring with PRTG

You can display with "echo" (commented) or XML for PRTG.

# Example

./postfix-stat.sh <time in minutes>

./postfix-stat.sh 15

# Output
## XML (PRTG)

<prtg>
    <result>
        <channel>Sent</channel>
        <value>0</value>
    </result>
    <result>
        <channel>Deffered</channel>
        <value>0</value>
    </result>
    <result>
        <channel>Bounced</channel>
        <value>0</value>
    </result>
    <result>
        <channel>Expired</channel>
        <value>0</value>
    </result>

## ECHO

108 mail sent
4 mail deferred
0 mail bounced
0 mail expired
