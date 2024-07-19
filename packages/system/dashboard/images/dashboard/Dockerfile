# Copyright 2018-2023 the Kubeapps contributors.
# SPDX-License-Identifier: Apache-2.0

FROM bitnami/node:20.12.1 AS build
WORKDIR /app

ARG VERSION=2.10.0
RUN wget -O- https://github.com/vmware-tanzu/kubeapps/archive/refs/tags/v${VERSION}.tar.gz | tar xzf - --strip-components=2 kubeapps-${VERSION}/dashboard

COPY apple-touch-icon.png favicon-16x16.png favicon-32x32.png favicon.ico mstile-144x144.png mstile-150x150.png mstile-310x150.png mstile-310x310.png mstile-70x70.png safari-pinned-tab.svg logo.svg public/

RUN sed -i 's/opacity: 0.05;/display: none;/g' src/components/InfoCard/InfoCard.scss
RUN sed -i 's/"Kubeapps",/"Bootstack",/' lang/en.json
RUN sed -i 's/Kubeapps/Bootstack/g' public/site.webmanifest
RUN sed -i 's/Welcome To Kubeapps/Welcome To Bootstack/g' ./src/components/LoginForm/LoginForm.tsx ./src/components/AppList/AppListGrid.tsx ./src/components/AppList/AppList.test.tsx
RUN sed -i src/components/DeploymentForm/DeploymentForm.tsx \
    -e '/const handleDeploy/i \  const packageName = packageId ? packageId.split("/").pop() : "";' \
    -e '/releaseName,$/ s|releaseName,|packageName + "-" + releaseName,|' 
RUN sed -i '/by VMware/,/ \.$/d' src/components/Header/Menu.tsx
RUN sed -i '/height: 4em;/ s/4em/5.5em/' src/components/Header/Header.scss
RUN sed -i '/background-image: / s|url("data:image/svg+xml;base64,[^"]*")|url("https://raw.githubusercontent.com/astrasky-net/bootstack/main/img/bootstack-logo-white.svg")|' src/components/Header/Header.scss
RUN sed -i '/background-image/a \  background-size: 85%;' src/components/Header/Header.scss

RUN yarn install --frozen-lockfile

RUN yarn run prettier-check && yarn run ts-compile-check
RUN yarn run build

RUN sed -i \
    -e 's/#2d4048/#202124/g' \
    -e 's/#25333d/#1e2023/g'  \
    -e 's/#fcfdfd/#f3f4f5/g' \
    -e 's/#f1f6f8/#e7e9eb/g' \
    -e 's/#e3eaed/#d3d6da/g' \
    -e 's/#cbd4d8/#b7bbc1/g' \
    -e 's/#aeb8bc/#989da3/g' \
    -e 's/#859399/#7b7f85/g' \
    -e 's/#6a7a81/#5b686e/g' \
    -e 's/#4f6169/#4f5256/g' \
    -e 's/#3a4d55/#3a3d41/g' \
    -e 's/#2d4048/#202124/g' \
    -e 's/#21333b/#383d44/g' \
    -e 's/#1b2b32/#2a2d2f/g' \
    $(grep -rl "#2d4048\|#25333d\|#fcfdfd\|#f1f6f8\|#e3eaed\|#cbd4d8\|#aeb8bc\|#859399\|#6a7a81\|#4f6169\|#3a4d55\|#2d4048\|#21333b\|#1b2b32")

FROM bitnami/nginx:1.25.2
COPY --from=build /app/build /app
