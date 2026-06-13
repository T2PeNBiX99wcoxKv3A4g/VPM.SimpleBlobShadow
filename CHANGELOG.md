# Changelog

## [0.2.1](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/compare/0.2.0..0.2.1) - 2026-06-13

### ⚙️ Miscellaneous Tasks

- Bump version to 0.2.1 in package.json - ([7ab9882](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/7ab988208b068f826a9f34c07fcf64d9bee8701d))
- Refine SimplePlaneShadow shader to use dynamicRadius for soft edge calculation - ([904ceb8](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/904ceb81f1da0667690a7db869e5fc90faafe8b0))

### Action

- Update `CHANGELOG.md` - ([27245d4](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/27245d455a389b83cf4c537daaca899df4093345))


## [0.2.0](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/compare/0.1.1..0.2.0) - 2026-06-13

### ⚙️ Miscellaneous Tasks

- Bump version to 0.2.0 in package.json - ([b24fd64](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/b24fd6426dec87300a2670f7961f358ee0da6489))
- Add SimplePlaneShadowMAEX prefab and metadata files - ([c060287](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/c0602879ad6dea484f743164c4b2d11f5bc8c7b2))
- Adjust SimplePlaneShadow prefab positions and transform settings for consistency - ([548e8b5](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/548e8b520ad3599a3c8e35887eb849dc64175a5a))
- Enhance SimplePlaneShadow shader with height-based fade and dynamic radius adjustments - ([b986f32](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/b986f321133f08e8eee1779317b7544854c9f46c))
- Replace Distance animations with Distance_Plane animations and add SimplePlaneShadow prefab - ([a4c6965](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/a4c69651e89572e33c7e38c56cb29df2a2638235))
- Add SimpleBlobShadowRaycast prefab and update SimpleBlobShadow prefab to support raycast-based shadow features - ([f6f1b4c](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/f6f1b4caf61d7f304fabd09a4ff40ea28b8596b9))
- Remove unused Distance layer and parameters from SimpleBlobShadow controller - ([d6b9658](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/d6b96581b6fbf7ffaed38a5d29b9627570f38c3b))
- Update SimpleBlobShadow material to disable MANUAL_FADE and adjust default _ManualFade value - ([5454a6e](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/5454a6e8060639d2433580046f166da6e3c03a02))
- Add SimplePlaneShadow material and metadata files - ([d46b08a](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/d46b08afc5a511df9aa3bcee97d01240eb163a2f))
- Add SimpleBlobShadowRaycast material and metadata files - ([2262606](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/2262606bdda5cf859bdfee47d267d9cd0dc9a1b4))
- Update Scale animation paths to remove unnecessary Raycast references - ([7e15713](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/7e15713e18b4a47293b3880158641f1679454341))
- Add Scale_Raycast animation and SimpleBlobShadowRaycast controller for blob shadow scaling adjustments - ([3f63b1f](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/3f63b1f4b46d966f2945281e5a6fd289573cb1ec))
- Change default values for HideInMirror and HideInCamera toggles in SimplePlaneShadow shader - ([a74dde9](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/a74dde904c7e326c3668c8384e0cf88aeb78ca83))
- Add clarification comments for camera near clip plane behavior in SimpleBlobShadow shader - ([cc444c1](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/cc444c11d01cb4acb964d6c49f5a8e5c34ae88c3))
- Refactor SimpleBlobShadow shader to use world position instead of view direction - ([f597661](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/f59766149f55979b28611b330b43f35ebb139b24))
- Add value clamping and improved range for Shadow Radius in SimpleBlobShadow shader - ([d07ea40](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/d07ea40a4331e64ff83d40dfe8309fb5e42704da))
- Remove unused GraphicsSettings and lilToon settings files - ([a813cac](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/a813cac9365a98a26e28045ebd2a791b2eab71bb))
- Update .gitignore - ([992b594](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/992b594d8a22a039cd6039b35a0750e3a57228ca))
- Remove unused grab pass and related code from SimpleBlobShadow shader - ([1ae97a0](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/1ae97a04e0f3bc21357a5be4aff3e194410f2702))
- Disable fog stripping in GraphicsSettings - ([f789f33](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/f789f3356e284e59f8b9087f804609648490813f))
- Enable fog stripping in GraphicsSettings - ([9e1a42d](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/9e1a42deb48ef46f11bb6f31d94a0229668ee006))
- Enable automatic API selection for iOS and POM feature in lilToon settings - ([9b9c8b9](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/9b9c8b9756bd8a6f620c72e7cedff3fbb6186449))
- Disable automatic API selection for iOS in ProjectSettings - ([2c0ea08](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/2c0ea08c7a32efa4ebd9137acb00b68ae24e2ad4))

### Action

- Update `CHANGELOG.md` - ([0447ec7](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/0447ec7904be8023108a4b2f114341c03832ebfa))


## [0.1.1](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/compare/0.1.0..0.1.1) - 2026-06-12

### ⚙️ Miscellaneous Tasks

- Bump SimpleBlobShadow package version to 0.1.1 - ([45caf97](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/45caf97d3adf69bc9757d7b298b3f547937c4990))
- Add blob shadow texture and update prefab icon metadata - ([7790b21](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/7790b21b21f4cd4038267967a118ab5071f5ef78))

### Action

- Update `CHANGELOG.md` - ([59666a6](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/59666a61b66fa3a5c38fccd77d13384aa4d0f532))


## [0.1.0](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/compare/0.0.3..0.1.0) - 2026-06-12

### ⛰️  Features

- Add scale animation and size layer to SimpleBlobShadow with updated assets and prefab adjustments - ([d5f7cae](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/d5f7caeaf8e7047546479441259baf5abb4810a3))
- Add Distance-based animation system to SimpleBlobShadow with new assets and prefab updates - ([f753262](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/f7532626cf043d51c3fbec7240c5bba1d29f7a2f))
- Add manual fade and height customization to SimpleBlobShadow material and shader - ([251043a](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/251043a5e16dcbda48e48cf7322aaffdfb0f0274))

### ⚙️ Miscellaneous Tasks

- Remove unused animation asset and metadata from SimpleBlobShadow - ([1cac2aa](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/1cac2aaf0ec84afe275bac86a0d19eab9435733c))
- Bump SimpleBlobShadow package version to 0.1.0 - ([36882b6](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/36882b6cd3668748d5b038ec363b903a94e238b6))
- Update ProjectSettings to enable automatic API selection for iOS - ([511747b](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/511747b4082625c880047027499e0fbcd6df6220))
- Update metadata and shader properties for SimpleBlobShadow - ([7cadb8d](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/7cadb8d7f845efe071d2c9259cdc352d15b893ce))
- Add Gesture Manager, AV3 Emulator, and Avatar Utils packages to Unity dependencies and lock files - ([3fb85ec](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/3fb85ec00ebeb324d5017c49d4cfeb369cbba947))
- Adjust SimpleBlobShadow material to increase shadow opacity to 1 - ([6ed5306](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/6ed530670e0f159897b361681b0ec4ef6e75186d))
- Replace Other-Ref128+ToBypassBlobShadow material with SampleRef128+ToBypassBlobShadow including updated metadata - ([492431f](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/492431fd4463e6f2d85c65dc5dd76f63011eb114))
- Add new animation and material assets with metadata for SimpleBlobShadow - ([0ff888f](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/0ff888ffa4c59b6ac63d4fc1835a2bb18444b52a))
- Update SimpleBlobShadow material and shader properties for improved rendering - ([d642590](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/d642590e93ac0567e8374d16829f7c3a3417e0ba))
- Add metadata file for SimpleBlobShadow animations folder - ([d2b162c](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/d2b162c91b64bf57d7c8df7c80af202c9db74b84))
- Update ProjectSettings to modify mesh stripping and API configuration - ([51e4151](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/51e4151f9223853e32439245eb1237edbced2972))
- Add metadata file for SimpleBlobShadow materials - ([a98e3cf](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/a98e3cf4d2f350c3692528a777218df09dd50644))
- Add metadata file for SimpleBlobShadow prefabs - ([331a243](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/331a243bf353a9fd06c6437c2404abf501b8d352))
- Add Yank Material Editor package to Unity dependencies and lock files - ([910c552](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/910c552a378187758b313626c96a81c6d264d2fa))
- Add metadata file for SimpleBlobShadow shader package - ([768d3ee](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/768d3ee65132040011e0c70bbaec6690c18e3080))
- Update Test.unity assets and metadata with new GameObject, components, and transformations - ([7394053](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/7394053497bffb315cd6114fee595506b6de13b4))
- Add import index JSON file for BLM integration core - ([8625bf5](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/8625bf5a8e826bc5b825e2d4d8bc6641e5723831))
- Restructure SimpleBlobShadow files, add prefabs, and introduce PlaneShadow shader - ([7ad0fec](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/7ad0fec7cd4ecdf950bc648aa8c1e01fd2007799))
- Update EditorBuildSettings to include Oculus XR configuration - ([bd3d7fa](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/bd3d7fa672cd821e184751c50e09f17aa4ca8c55))
- Add and update Unity package dependencies, configure scoped registries in manifest files - ([acc33b9](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/acc33b9ca88a059ce4f8f2a5b64396cdd1269c02))
- Update ProjectSettings for API configuration and scoped registries - ([383bd3a](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/383bd3ad300d6261557d98261d8c4fbd237aa790))
- Add lilToonSetting.json to configure lilToon shader project settings - ([58cdbf2](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/58cdbf24918e501b1a5892312a3b2acee63fea06))

### Action

- Update `CHANGELOG.md` - ([f9dded1](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/f9dded1f4794f862a98a075e27fbdc9244421b96))


## [0.0.3](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/compare/0.0.2..0.0.3) - 2026-06-10

### 🐛 Bug Fixes

- Update SimpleBlobShadow material color and shader blend mode settings - ([667a08c](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/667a08c9ded8459a63939d898272f37780d64d55))
- Enable automatic API selection for iOS in project settings - ([863eee4](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/863eee49247be5d775000fcbcca70840e0a84946))

### ⚙️ Miscellaneous Tasks

- Bump version to 0.0.3 in SimpleBlobShadow package.json - ([a1e8679](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/a1e86790f6db507a174b0019f31bc49af07c9705))
- Update Unity package dependencies and adjust iOS API settings - ([a5ad528](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/a5ad528d6df5d5571bc6a10d317111beea3576f8))

### Action

- Update `CHANGELOG.md` - ([c2fa2a7](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/c2fa2a70aa0909392c9c9aece94719577c46a1d5))


## [0.0.2](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/compare/0.0.1..0.0.2) - 2026-06-10

### 🐛 Bug Fixes

- Update SimpleBlobShadow color and blend mode settings - ([25d4c1a](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/25d4c1aa444a937489dd4c1c189a4e35f6be6b25))
- Replace GameObject, update collider, and enable automatic API for iOS - ([ac3ee9a](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/ac3ee9af62eeb24650ddd7af68878ec6a44b931e))
- Adjust iOS settings and script metadata in project configuration - ([9bff5c6](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/9bff5c63c0ecf59cae1c8bc994c38de1fd6917b4))

### ⚙️ Miscellaneous Tasks

- Bump version to 0.0.2 in SimpleBlobShadow package.json - ([9b2a0a0](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/9b2a0a03a77ec700d68965af6eff223022ad5449))
- Remove unused VRChat demo-template package - ([a983a29](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/a983a290dd784a3c7a011ba079bf2d0eb840b054))

### Action

- Update `CHANGELOG.md` - ([add22aa](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/add22aa1ef3edd5baa6a6331da0e61d04df01f7f))
- Update `CHANGELOG.md` - ([93c74e2](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/93c74e280997cf89c06ca6a89c1e01c997ba46fe))


## [0.0.1] - 2026-06-10

### ⛰️  Features

- Add VRCFallback tag to SimpleBlobShadow shader - ([905cb98](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/905cb98bf3172e1fe147264b1e9fbb81944a060c))
- Add initial implementation of VRChat Package Resolver and Simple Blob Shadow packages - ([24e636d](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/24e636def66255503a9924cc9c7d5527eb8dae27))

### 🐛 Bug Fixes

- Correct changelog URL in SimpleBlobShadow package.json - ([e9a4b66](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/e9a4b66a690f177c924fdcf76b58a2d24c612cbd))
- Update workflow path for SimpleBlobShadow package - ([9b07ff8](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/9b07ff854e40426042452308b8d4a43ec1ca1a0a))

### Action

- Update `CHANGELOG.md` - ([7715ede](https://github.com/T2PeNBiX99wcoxKv3A4g/VPM.SimpleBlobShadow/commit/7715ede3fa1b1b287bb413072f3a5162ef90a55e))

## New Contributors ❤️

* @github-actions[bot] made their first contribution
* @T2PeNBiX99wcoxKv3A4g made their first contribution

<!-- generated by git-cliff -->
