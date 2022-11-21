<@showStatement statement property />

<#macro showStatement statement property>
    <#assign mastodon_link = (statement.value!).trim()>
    <a rel="me" href="${mastodon_link}" target="_blank">Mastodon</a>
</#macro>

