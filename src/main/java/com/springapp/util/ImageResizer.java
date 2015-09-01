package com.springapp.util;


import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

//відповідає за зміну розміру картинки
public class ImageResizer {

    public static byte[] resizeImage(byte[] image, int width, int height) throws IOException {
        BufferedImage newImage = getScaledInstance
       (ImageIO.read(new ByteArrayInputStream(image)), width, height, RenderingHints.VALUE_INTERPOLATION_BILINEAR);

        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ImageIO.write(newImage, "jpg", byteArrayOutputStream);

        return byteArrayOutputStream.toByteArray();
    }
           //отримує та змінює парамметри маштабу
     private static BufferedImage getScaledInstance(BufferedImage img, int targetWidth, int targetHeight, Object hint) {
        int type = (img.getTransparency() == Transparency.OPAQUE) ?
                BufferedImage.TYPE_INT_RGB : BufferedImage.TYPE_INT_ARGB;
        BufferedImage ret = img;

        int imgWidth = img.getWidth();
        int imgHeight = img.getHeight();

        if (imgWidth < targetWidth || imgHeight < targetHeight) {
            imgWidth = targetWidth;
            imgHeight = targetHeight;
        } else {
            while (imgWidth != targetWidth || imgHeight != targetHeight) {
                if (imgWidth > targetWidth) {
                    imgWidth /= 2;
                    if (imgWidth < targetWidth) {
                        imgWidth = targetWidth;
                    }
                }

                if (imgHeight > targetHeight) {
                    imgHeight /= 2;
                    if (imgHeight < targetHeight) {
                        imgHeight = targetHeight;
                    }
                }
            }
        }

        BufferedImage tmp = new BufferedImage(imgWidth, imgHeight, type);
        Graphics2D g2 = tmp.createGraphics();
        g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION, hint);
        g2.drawImage(ret, 0, 0, imgWidth, imgHeight, null);
        g2.dispose();

        ret = tmp;

        return ret;
    }
}
