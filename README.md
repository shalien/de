
A Discord bot that allows you to download attachments from a given channel


## Installation & Usage

- Clone the repository
- Create a Discord bot using the official [Discord Developer Portal](https://discord.com/developers/applications)
- Get your bot's token and add it to the `lib\src\token.dart` file
- Invite your bot to your server with the following link: `https://discord.com/oauth2/authorize?client_id=<CLIENT_ID>&scope=bot&permissions=66576` (replace `<CLIENT_ID>` with your bot's client ID)
- Run the bot with `dart run`
- Right click on a message and choose one of three modes :
    - `This message` to download the message's attachments
    - `After this message` to download the message's attachments and all the attachments of the following messages
    - `Before this message` to download the message's attachments and all the attachments of the previous messages
- The attachments will be downloaded in the `attachments` folder inside the bot's folder

## Privacy concerns

This bot does not store any data. The only data it uses is the Discord messages and attachments that you choose to download.

## License

PROJETRETRO RESTRICTED LICENSE (PRL)

license@projetretro.io - 2024

THE PRODUCT TO WICH THIS LICENSE IS GRANTED IS DISTRIBUTED "AS IS" AND WITHOUT ANY WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. THE USER OF THE PRODUCT ASSUMES ALL RISK OF USE, DAMAGE, OR INJURY. THE USER IS SOLELY RESPONSIBLE FOR DETERMINING THE SUITABILITY OF THIS PRODUCT FOR ITS INTENDED USE.

BY USING THE PRODUCT ATTACHED TO THIS LICENSE, YOU AGREE TO THE TERMS OF THIS LICENSE. IF YOU DO NOT AGREE TO ALL OF THE TERMS OF THIS LICENSE, DO NOT USE THE PRODUCT.

THIS LICENSE IS A RESTRICTED LICENSE. IT MEANS THAT YOU CAN'T USE THE PRODUCT IN ANY KIND OF COMMERCIAL PRODUCT, EVEN IF THE PRODUCT HAS A FREE AND OPEN SOURCE VERSION. IT ALSO MEANS THAT YOU CAN'T USE THE PRODUCT IN ANY KIND OF PRODUCT AND/OR PROTOCOL AND/OR SERVICES RELATED TO AI AND/OR MACHINE LEARNING.

THE PRODUCT CANNOT BE RELICENSED UNDER ANOTHER LICENSE.

THE FOLLOWING EXCEPTIONS APPLY TO ANYONE WHO USES THIS PRODUCT:

Using the product FREE OF ANY KIND OF CHARGE in a public educational case.