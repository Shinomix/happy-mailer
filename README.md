# Happy Mailer
> A daily dose of happiness to deliver to your friends and relatives

## Purpose
The happy mailer is a simple Ruby 1.9+ application you can use to send a random happy email to one of your contact using your Gmail account

## Setup
### Gmail
If you're not using MFA access for your Gmail account, you need to go on the [Google Settings](https://myaccount.google.com/lesssecureapps) page to delegate email sending rights to a third-party application.
If you're using MFA access for you Gmail account, you need to generate a specific [App Password](https://support.google.com/accounts/answer/185833?hl=en) and save it up. _(credits to rainkinz on SO for [the answer](https://stackoverflow.com/questions/33918448/ruby-sending-mail-via-gmail-smtp))_

Note that the first time you will want to send email, it may not work and you may receive an email from Google reporting an anormal activity (you're using a CLI, not an official client after all)

### Credentials
Most of the configuration files names can be configured from `conf.rb` but to start up you only need to setup the following ENV variables:
- `HAPPY_MAILER_USERNAME`:
  - Add the variable: `export HAPPY_MAILER_USERNAME=<your_gmail_email_address>`
  - (replace `<your_gmail_email_address>` with your real Gmail address - i.e `john.doe@gmail.com`)
- `HAPPY_MAILER_PASSWORD`:
  - Add the variable: `export HAPPY_MAILER_PASSWORD=<your_gmail_password>`
  - (replace `<your_gmail_password>` with your real Gmail password - or the generated App Password if you have MFA enabled)

### Templates and mailing list
The happy mailer is provided with examples templates you can customize:
- Named templates are the ones used when the application is able to recognize the recipient's first name. Variables can be used to enrich the content: `%{recipient}` to designate the recipient and `%{sender}` to designate the sender.
- Anonymous templates are the ones used when the application can't find the recipient's name. They don't provide content interpolation.

The list of contacts to send emails to can be filled in `recipients.yml`

## Run
The happy mailer can be run in two different ways:
- As a one time thing running `./run.rb` or `ruby run.rb`
- As an automated cron job:
  - TODO explain how to run a cron job on different envs
