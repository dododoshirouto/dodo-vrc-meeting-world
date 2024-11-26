「towa Virtual Functions インスタンス通知アセット」

【概要】
このアセットをVRChatのワールドに設置することで新しいインスタンスが立ち上がった際にPUSH通知やDiscordへの通知を送信できます。
このアセットはtowa Virtual Functionsシステムを利用しております。

【設置方法】
A. [VRChat CreatorCompanion (VCC)]にて[Worlds U#]テンプレートを使用した新しいプロジェクトを作成します。
B. [Assets] -> [Import Package] -> [Custom Package]メニューより、[VFNotification.unitypackage]を読み込みます。
C. [Projectウインドウ]より、[Assets/Kanagi/SimpleMirroSet]内の[VFNotification.prefab]を[Hierarchy]にドラッグアンドドロップします。
D. towa(https://l08.me/)のVirtual Functions設定画面よりワールド用にインスタンス通知アクセスURLを新規発行します。
E. [Hierarchy]内の[VFNotification]ゲームオブジェクトを選択し、インスペクタ内[VF Notification URL]項目に発行したURLを貼り付けます。

【towa Virtual Functions インスタンス通知 設定方法】
い. towa(https://l08.me/)へアクセスし、利用規約・プライバシーポリシーを確認・同意の上、新規登録をします。
ろ. towaホーム画面(https://l08.me/home)の[towa Virtual Functions]項目より[はじめる]ボタンをタップ
は. towa Virtual Functionsダッシュボード画面の[Functionを作成]ボタンより「インスタンス通知」を選択し作成します。
に. Function設定画面に本アセットに設定する[アクセスURL]が表示されますのでコピーして本アセットに設定します。

ほ. (オプション) Function詳細画面より[インテグレーション（連携設定）]ボタンをタップします。DiscordWebhookの設定項目にDiscoardにて取得したWebhookURLを貼り付けて設定します。
へ. (オプション) PUSH通知を受け取るためにスマートフォンでtowaにアクセスし、towaをホーム画面に追加(iOS)、インストール(Andoroid)にてスマートフォンにインストールします。
と. (オプション) スマートフォンにインストールしたtowaアプリを起動し、[設定]->[PUSH通知]よりPUSH通知を有効にします。

【依存】
本アセットはVRChatにおけるワールド制作を想定して作成したアセットです。
VRChat SDK3並びにUdonSharpに依存しています。
本アセットはtowa Virtual Functionsシステムに依存しており、towa(https://l08.me/)にて専用URLを発行する必要があります。

【使用条件・ライセンス等について】
本アセットを許可なく改造、再配布することはできません。また本アセットを使用した際のいかなる損害についても製作者は一切の責任を負いません。
無償・有償アセットの一部として本アセットを無改編で含めることは可能です。有償無償を問わず本アセット自体を再配布することはできません。
本アセットを利用するにはtowaへの会員登録が必要となり、towaの利用規約およびプライバシーポリシーに同意する必要があります。
本アセットはtowa Virtual Functions専用のアセットです。towa以外が提供するサービスのクライアントアセットとして使用することはできません。
towa Virtual Functionsのシステムアップデートにより予告なく使用できなくなる可能性があります。

【製作者】
かなぎ
https://l08.me/p/kanagi_amatsu

【宣伝】
VRChatなどのバーチャルSNSユーザー向けのお役立ちサイト「towa」を運営しています。
https://l08.me/
● 無料でリッチなプロフィールページを作成できます。
● プロフィールを作成したらTwitterのBioやVRChatのリンクにURLを貼り付けてプロフィールを公開しましょう。
● プロフィールページ以外にも様々なお役立ちサービスを提供しています。
