-- CreateTable
CREATE TABLE "Media" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "username" TEXT NOT NULL,

    CONSTRAINT "Media_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Post" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "text" TEXT NOT NULL,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Publication" (
    "id" SERIAL NOT NULL,
    "mediaId" INTEGER NOT NULL,
    "postId" INTEGER NOT NULL,

    CONSTRAINT "Publication_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Publication_mediaId_key" ON "Publication"("mediaId");

-- CreateIndex
CREATE UNIQUE INDEX "Publication_postId_key" ON "Publication"("postId");

-- AddForeignKey
ALTER TABLE "Publication" ADD CONSTRAINT "Publication_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "Media"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Publication" ADD CONSTRAINT "Publication_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
