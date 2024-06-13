**Run Cloudflare-Gateway-Package**
### Note
---
* Script not update any more. Please use main repository [Cloudflare-Gateway-Pihole](https://github.com/luxysiv/Cloudflare-Gateway-Pihole)

* Set Variables, Please read [Cloudflare-Gateway-Pihole](https://github.com/luxysiv/Cloudflare-Gateway-Pihole#README.md)

### Schedule 
---
> Because limited 2 months commited from Github Actions. So you can create and paste this code to run on Cloudflare Workers. Remember,Github Token generate no expired and all permissions
```javascript
addEventListener('scheduled', event => {
  event.waitUntil(handleScheduledEvent());
});

async function handleScheduledEvent() {
  const GITHUB_TOKEN = 'YOUR_GITHUB_TOKEN_HERE';
  try {
    const dispatchResponse = await fetch('https://api.github.com/repos/YOUR_USER_NAME/YOUR_REPO_NAME/actions/workflows/main.yml/dispatches', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${GITHUB_TOKEN}`,
        'Content-Type': 'application/json',
        'User-Agent': 'Mozilla/5.0',
      },
      body: JSON.stringify({
        ref: 'main'
      }),
    });

    if (!dispatchResponse.ok) throw new Error('Failed to dispatch workflow');
  } catch (error) {
    console.error('Error handling scheduled event:', error);
  }
}
```
>> Remember set up Cloudflare Workers cron triggers
>>> Deloy success is ok, don't care about log console 
