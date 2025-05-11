'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "3dcd55f8d134236dbf9d8e1ac28b0295",
".git/config": "4d7134d75bec6903d5317a3066e08bff",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "a243691215d26db0ccc5e4caae055c3a",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "0a69ac2594e69685f8adbd3a13e26af6",
".git/logs/refs/heads/gh-pages": "07a50e8879547016ea696a901e08517f",
".git/logs/refs/heads/master": "d63851594c498c280889697f22c80068",
".git/logs/refs/remotes/origin/gh-pages": "d163e10cf7d05819e3b11e6e8618d4a7",
".git/objects/02/4bc7769f198ed60fc15fda94dae98a5ac0eba4": "2b2abcd1ea5f5c3e0f1b9ceee9caec26",
".git/objects/05/58f518ce3feb8a6b88eba864440049975dd43c": "1c311c44059165f9f43dae9759a1a004",
".git/objects/05/a9058f513cce5faf1704e06e3c150688b0a01f": "e8d02f60cf87abd4c1de4b153dd696dc",
".git/objects/06/ac8bc27efa89602fbfd1aa2b81f1636a77e006": "9a1d51f96452686fc5d40c2cadf4afc3",
".git/objects/06/bd4af2913180af0aa311a0d2314320bf9440f8": "61a8af56814bee96e8529879acee247c",
".git/objects/08/a3617c3f2f30f5e95301739f2d0a17992bc96c": "ede989dd2fc830a7d7595127636e421d",
".git/objects/0a/e7fb2309b9e20cf4d598e91151e8afdf17d185": "ea7f53b4c6ee0a3098bfa1f0fff1ae72",
".git/objects/0e/428dc3d3b4cf22f262b97584e7bf4ab01d9869": "dd97108f5604f36588c8f1ac43238851",
".git/objects/10/9a4e45d2624e9ca619fb3661ba008c1cd822a2": "35b12082e6fe0e6508286f688d7ef2b0",
".git/objects/11/9d9f9a548b9e7c7b71c913aac7385f138af2df": "d4663ce83dbaabbb8bf02f877ea149b9",
".git/objects/12/dcc4ad38b28308d499658b275020f0599021db": "d4f930a4bb18727cd7dbd58e24aa5086",
".git/objects/13/456db11a23587b0945b6767ec0eb89ab15d804": "a02cf2192084f6de4dcfdff15db25598",
".git/objects/14/7f92616cfe7a5c90e3fcc2aeecb449aebd6029": "9e20a3e2056d409f21ef65ffb5146a33",
".git/objects/14/c2a68124593b6147e6c1363c5ece479c9c31a3": "33418c2bbe4cd27d204b1c145321b044",
".git/objects/17/11fd5cb6354f2854bbca154842eecc6e42df94": "544cf2b3978d9710e707d32c2a368479",
".git/objects/1a/06e736afa434fb9d24028175d215035db21488": "6743a8cf07100cccee4929cdcb6b085b",
".git/objects/1c/5dff3f0785a35494fdc9fe2dde70e54701cf68": "51aae2468077679443dac4b988f438c7",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/25/0c15f225979fed5394cf69a4e65810786a7613": "f728044e94ae209c276423b189858f79",
".git/objects/25/3fd3ccb8496caa606f13bdff74f9b2981715dd": "3a4ac81169f67681fbd5a8eee7ed9c5d",
".git/objects/27/a297abdda86a3cbc2d04f0036af1e62ae008c7": "51d74211c02d96c368704b99da4022d5",
".git/objects/2a/3433b59bce9733781525048301a37ac9d99593": "85b118a0212a99a3061c47eb47c471d4",
".git/objects/2e/4fcfbca1ea965f74743f0ef1a6824a7db2c392": "f1a552cd59c82032d1cba4caa4cfa655",
".git/objects/2f/9bf586bf17d0267688799a2c47eef8fb72ecc5": "bb9918d7e80e44e063caaa94545e4c5d",
".git/objects/30/ba0f97cbd7b5681168b38d2537952c9085f5bf": "760ba9fc394af51c6accb2011f3ed09a",
".git/objects/32/1fa0e6cf16f226f70782fa4f16e624ee3aa857": "764f6603061f0751521cbc2f88417f2b",
".git/objects/34/bb698bcb28a3971a50d9d6740649e684e53a13": "89b80e870767fe95921eed70cb218936",
".git/objects/36/2d6c63b24870114f4b12934eeff86f4da24047": "6892a09ac77891120602d9248d974666",
".git/objects/39/7a42cca0bc219ac8578aa337e45c2d829c901f": "02472f236040fc5155fe49569cdebcbd",
".git/objects/3c/b4712eb2ade8d7aadadcea09ec5822484c4a74": "b2605fb7ee156fc595d310767f5a6af6",
".git/objects/3f/ac92b950bf8281c62c446eea6578c5f38ea5bb": "6e03bbab161f5647171f6667a1344754",
".git/objects/44/572647c67132b9f12343cdbef76ebc8dd7c7f0": "0a9a6fe547886f86c4a21a8a5c042745",
".git/objects/46/02dd9a3e9ee62eedc87127970fb4d6358026cb": "f2fbdeed840762bca24a0daa3819553b",
".git/objects/49/601fcc48b87e2b92deed24ca8b52f176f11090": "f8f99d68f4436a8a9f1cef14af89bcb5",
".git/objects/4a/7e723edbb95c8bd881652ba621c14020f14e8c": "b41c2a8b0177e79c49442d5e0c70e049",
".git/objects/51/284c3f7e70102b0aa845efa8fbe24cf3ca3019": "b5f425d42daa401ef665ceee4d6cedb7",
".git/objects/52/46602b8b4e85ee8451388b0d3c40cf44aeb1df": "aa93f715a0bae3614c59d1a63109563d",
".git/objects/55/f4bb907711d5c7353936d7c35419a97e98a3c0": "bc247449e7676ceb0def78d2bad79861",
".git/objects/59/72405409bf1a37a3b9136ab911866e9bf31acc": "1135ebd65f7d629006333f4ba7d80c32",
".git/objects/5b/60f2a429e48c7e5b3dbf6fbccec535b6d9fcb9": "fc5dbb5ded3067b22340239e483dff6a",
".git/objects/5e/f67098308c417db1e2e9d6ba878d1adce8c30f": "7347164a93c65cca0502c6c0846faee2",
".git/objects/63/6931bcaa0ab4c3ff63c22d54be8c048340177b": "8cc9c6021cbd64a862e0e47758619fb7",
".git/objects/66/6456e8f5a7c2e031c7cb6246cbaa69891534a5": "04fef0037a65b207ac6ef9ad9288b0af",
".git/objects/6b/6f5f2dfdf6f4d97a4936be02cbff246273ef0b": "6dc8e56ece0481584c410c34a485eea8",
".git/objects/6d/5f0fdc7ccbdf7d01fc607eb818f81a0165627e": "2b2403c52cb620129b4bbc62f12abd57",
".git/objects/6e/afa8899745860b6d27dd686abdb3433ea2dcf9": "415274e3dfdbfe8ebf44be6dde6177fc",
".git/objects/73/7f149c855c9ccd61a5e24ce64783eaf921c709": "1d813736c393435d016c1bfc46a6a3a6",
".git/objects/75/28ec002c13105803edd669690743eaa1468814": "82377538079a6cfdce3b32f8a29c83ad",
".git/objects/75/a89f9a9a33312403199e867dc00300017ffa53": "c0b0c2677ce6de2430f6e60bdef9264a",
".git/objects/7b/d33e6ec9e48bd585b26790247d6b25fc98b8cc": "a84d6b1e572cc6944558572a2aafb477",
".git/objects/7e/8a6923a67c5f94daba5f371a0311cbd1b22810": "fd57d44fcb21b55c65f8a3bff061306b",
".git/objects/7f/5ae1d9e038f36ea9796193fd8a60507078fffb": "9a7d2ce17482214568d51cfea6e1b5a8",
".git/objects/7f/90ea106365609ac6372befc005172b4af7ddc4": "47b47d1b8ea17ddb622dad89bef464e6",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8c/59773bee8314a8ffb4431593d0fb49f52e34c6": "2eb993d30677573ffd0e58484cc6a514",
".git/objects/91/9446485ab3fcff9d7824131e542aadd4763d0e": "1e95b270c93d66773760e7f383e08453",
".git/objects/95/96af3fef94a3873aeb8d867fc7a4d0895a0d0b": "b18c37d5e76064104c36c7b8cdcc8fd1",
".git/objects/97/87f9f198136cf368f38fde258dc6d0adc7557d": "6120ecb6a08ac2d5906d1df6eb1f95c8",
".git/objects/97/8a4d89de1d1e20408919ec3f54f9bba275d66f": "dbaa9c6711faa6123b43ef2573bc1457",
".git/objects/98/23c6d96b70b4d2c54b6627e52cfe4306b1b929": "23e89eebde479efd386bc9cfb002d1d1",
".git/objects/99/4bcb92e33b077a0b732ac4462e1575a8f22010": "e3985ea9118680425f7d6e3b6f10d749",
".git/objects/9d/a33b74e5676971e8d9c0c30370bb16ddabee84": "8d92efcaa42e5e68f93eadc6efe78a68",
".git/objects/9f/069b555037e28a2b2b5f716078194cc76bdab6": "4c4c7cde72b4376daebeb11148d4a4b1",
".git/objects/9f/20f0529aab3e3891510fe3f6548922360691f1": "119405e40703d2cbef4ff91c2ba974b2",
".git/objects/a1/0c9c4cc075b4936e9796fa11c03d026c33daed": "a97d3dd966e8ec8079ec416c3ddde0ee",
".git/objects/aa/079922d4894f7d1d7d88cbb0d24a042bde5a02": "46c24a3f6b2eabe8d5bd9b53f6ebda86",
".git/objects/aa/c07d34b794ec7acdadcb96c292ddf95e315235": "0afb6dc54a42b521efcd59dfec571153",
".git/objects/ac/d8cde7c7fc929797e3c820b34ea6c547e0912e": "464f9e810578d4c9864f8c5afa3d931a",
".git/objects/ae/14d0ac1e027c558387ed3b5b21a34e3d3108c4": "ea73b027c56ce134c296eceab831d10c",
".git/objects/af/31ef4d98c006d9ada76f407195ad20570cc8e1": "a9d4d1360c77d67b4bb052383a3bdfd9",
".git/objects/b1/413dafde40da2bdf26b226889972cb8ee3d284": "7c2515f4450a1dd66d805c4025dfd2d5",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b1/afd5429fbe3cc7a88b89f454006eb7b018849a": "e4c2e016668208ba57348269fcb46d7b",
".git/objects/b1/c30304ae4f62c2d02113945dc19a520bdc3c8b": "8501029dc55e384e80c0c1fd4f124bc5",
".git/objects/b2/a8907404bad709639b9715acf988a158649f92": "25173363b66333e759a5dcebc72f7563",
".git/objects/b6/a76663561edfd2a7e8eda1afd5e03a7adae08a": "7724da622123f80a2483e7f929897cf3",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b8/84c0fa995708ddbaad0f8ef74b73b7ee006fc3": "b9113df99d8ccd9f6960bc316fc7f341",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/ba/757092d2243b3af1d75cbac4bff18157de66d7": "61ca3e1cc48ce75b03f7efe76ca67839",
".git/objects/ba/c91ab3ae162bfed3d5ef632a68d76875c2f816": "4b36604a2e70318b4fd6bd393c8ba29c",
".git/objects/be/a6d82a76feec86ffa021e9d4993da736351713": "87401a90901e02252355ec07648cbbe6",
".git/objects/c1/a6a8b9e02a2727e568b020aac28bbdbb7ca7e0": "8036cd7f4702d5504f335d115693eb96",
".git/objects/c3/e81f822689e3b8c05262eec63e4769e0dea74c": "8c6432dca0ea3fdc0d215dcc05d00a66",
".git/objects/c6/06caa16378473a4bb9e8807b6f43e69acf30ad": "ed187e1b169337b5fbbce611844136c6",
".git/objects/c9/d27ee3797cc2b07bce2aacb2a3e76d70958c06": "6a3cf90705d08ee2c7092ecde405c420",
".git/objects/cb/30335fd53634c6d2673009ec6fca3de59db31b": "e7a37d568dcc3fcb1c6143f9ffc2ded5",
".git/objects/cc/22dbdd762271e727501d7d68aa3e32498ad6ff": "b5745c77883252cc1962146171af4095",
".git/objects/d1/123d89fa1d016f93595ff75dfe495ed8f06cdb": "e3b1e787394368e546df410a9aded5ab",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/db/0dc3491de99d343e78d2eb94c9fc64fb970d03": "e4bbc683ae7001c6a007c02ba7b203b6",
".git/objects/dc/0f589d370968b9a7f3cc3b66fb1e995fd79e8b": "9738c1a3fd9c56881a74b0b085bd19df",
".git/objects/dd/b6af87a0235124d0a3ec2fd1362a92c1cc147f": "bbac6cb8a51d3ae6d4e8ce2cddf25b33",
".git/objects/e0/12271ac4d68a7ea56b40a1c3f24f5b92725cb8": "117212a10b84a1dc3931a06e24e09ed7",
".git/objects/e1/6a04742ef9f4e8e071890487c6ed0761b4fbed": "8029d03777ab5b26337da9cc22f73029",
".git/objects/e2/0c465d43394157e3947db735559785c533468a": "74ef0fe5be8fe9b2b8a555646ffcb9f0",
".git/objects/e2/857971e829bce9156c99e9b5992316b898abb3": "530e4a998f49de39067c5b2c4d81c326",
".git/objects/e3/50d10130f56e15d9ae9b7795806c1905333500": "900025d6222c09cb2643de1435b3e9b6",
".git/objects/e7/260f2e0c9f51f63b46f202a3032482081e71a8": "0b72cbf33c0554e60aca470f9c075de1",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/32a8f8bb4fe7890dc7f93974974ef7c2e1a17b": "4ad7140922bd8808cbd373f6e3b17c96",
".git/objects/ec/361605e9e785c47c62dd46a67f9c352731226b": "d1eafaea77b21719d7c450bcf18236d6",
".git/objects/ec/42cbe60b2831a82239d14570f7a5ea8d6cb068": "b577aee48871edbb2b2c77b15942b900",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/e1295240c4d502eb31e3db143c07bab4846356": "b16da94d8c381c95ec9faf36b9562c06",
".git/objects/f5/7efd50b166316976e4e2bc5b537f78d722b5fd": "a32c3206660a63161d58fa7746ce81c0",
".git/objects/f8/20ad238f7e1aaedc6c6cbd011ac6bcaba2c8cb": "a18beb775ec5db60b0ea103f014a3d6a",
".git/objects/f9/2698b9d11eb2950b835597d777e3e0fedbd49f": "3df6ff24fd941353554f221cdac6e7b6",
".git/objects/fd/443a8702497ad51458ff9801c7571b11af3953": "9e56e6301acd2c98337ccfc9bf539781",
".git/objects/fd/b3c3ea1e459d1d87f67eb2389a347899f5ed3a": "fff3f789545201c0ede24ce95643b259",
".git/objects/fd/b64599a756cc858d6bb96549ae0e38b791b517": "1e7f3d98fe3820ed82b4d17848fb412c",
".git/objects/fd/b94184717d21056ac730390d3aedb19c25dedb": "b2e9b9b755cf8d00dce618f3e2c5562b",
".git/objects/fe/d8d619ad67d64e735de33b294615b9f81ff400": "0647902b1471fc0d6a1469ff1218fdf0",
".git/refs/heads/gh-pages": "598398e9bdbd32f229098ccabf89fae3",
".git/refs/heads/master": "576cd64abd1329e4d02c99f704ed57f4",
".git/refs/remotes/origin/gh-pages": "598398e9bdbd32f229098ccabf89fae3",
"assets/AssetManifest.bin": "f1b8c1d435aedd66751794eb81e31a44",
"assets/AssetManifest.bin.json": "791c9366422abe4ad1d52346c43a8ffa",
"assets/AssetManifest.json": "83875d7c5956a9fda537a7314800ffb6",
"assets/assets/about.jpg": "36e0e9fe79543f759f708cd0df8caac4",
"assets/assets/android.png": "4fe96f1542c2f699ea67e5543fe04fae",
"assets/assets/Angular.png": "84809a9d6c29dab140b1cabaf089bef2",
"assets/assets/face.png": "358b5ffc122ea97c2c5679a27ca3b901",
"assets/assets/flutter_garbage_weight_management_img.png": "4cac472c940bcbcf05b8e5d827e38068",
"assets/assets/flutter_logo.png": "540d9c52637faf6016c607cc3e67d356",
"assets/assets/hidoclogo-desktop.png": "88864ff3edbf19e7b48becc4aef595b2",
"assets/assets/hidoc_home_page.png": "c589054ce27d9138645e1354e43b43cf",
"assets/assets/img_company_logo.png": "68e91c0b7f8e324785553d8f261e5a63",
"assets/assets/javaScript.png": "dd9557a59952d74a23c5d3a3994428cc",
"assets/assets/laptop_me.png": "5bde483ad6bd5243cae879c72009cf93",
"assets/assets/lippincott.png": "9f336fba5179cf14acb100c1e21982e4",
"assets/assets/lnsWeb.png": "df62cbb6d1a2a29b21821e6973b2dca6",
"assets/assets/lns_mobile.png": "518518e78600038b1a876b5697da25ea",
"assets/assets/LOGO.jpg": "ef41d3acdf618a967ebc82b6c4322a46",
"assets/assets/nmc_face.png": "ad2d8aace2e09c6b5b0d3d1fd896c334",
"assets/assets/personal.png": "cf2e360b75449881c8b4cfcd59ce39dc",
"assets/assets/Resume_mohit.pdf": "07de606145c29beeecf90a684d5113d5",
"assets/assets/snap@champ_img.png": "805aa824a7fc74d3bebe23ff6557e833",
"assets/assets/snapChamp.png": "587c2bdbb2c2624e1621ac2618e6cc4c",
"assets/assets/sunrayz.png": "1c089e5701f148fb53dbff36c27ee371",
"assets/assets/sunrayz_mobile_demo.png": "fed4640dd3d536437595b81f024aba6d",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "088f1f29ee2645caf978f325e0b6d649",
"assets/NOTICES": "796ca46576d1e74de84b8eb08f634e68",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "fc43dc29c02324f6595eed80ad565f40",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "66139f4b493c89164f6597710f46357f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "0abc38310443be0da3a468d8afd0f68c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "30ada12a7f3a21656677065113c4be36",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "1b332e27a6f80523be7134feba752007",
"/": "1b332e27a6f80523be7134feba752007",
"main.dart.js": "c92619af6aa12dc90afc1322b91e1f9a",
"manifest.json": "b73346d55f3e3585730949fbf692fef4",
"version.json": "5c5ebc6252071fe8552d0dc55a85716c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
