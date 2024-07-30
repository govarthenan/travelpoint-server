PGDMP  +                    |            travelpoint    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16436    travelpoint    DATABASE     �   CREATE DATABASE travelpoint WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE travelpoint;
                postgres    false            �            1259    16449    posts    TABLE       CREATE TABLE public.posts (
    id integer NOT NULL,
    poster integer NOT NULL,
    caption character varying(255) NOT NULL,
    image bytea NOT NULL,
    "timestamp" timestamp with time zone DEFAULT now() NOT NULL,
    likes integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    16448    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public          postgres    false    218            �           0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public          postgres    false    217            �            1259    16438 	   user_info    TABLE     �  CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    phone_number bigint NOT NULL,
    location character varying(50) NOT NULL,
    password character varying NOT NULL,
    nic_passport character varying(50) DEFAULT 0 NOT NULL,
    email character varying(50) DEFAULT 0 NOT NULL
);
    DROP TABLE public.user_info;
       public         heap    postgres    false            �            1259    16437    user_info_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.user_info_user_id_seq;
       public          postgres    false    216            �           0    0    user_info_user_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;
          public          postgres    false    215            "           2604    16452    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218                       2604    16441    user_info user_id    DEFAULT     v   ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);
 @   ALTER TABLE public.user_info ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    16449    posts 
   TABLE DATA           O   COPY public.posts (id, poster, caption, image, "timestamp", likes) FROM stdin;
    public          postgres    false    218   �       �          0    16438 	   user_info 
   TABLE DATA           z   COPY public.user_info (user_id, first_name, last_name, phone_number, location, password, nic_passport, email) FROM stdin;
    public          postgres    false    216   .       �           0    0    posts_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.posts_id_seq', 8, true);
          public          postgres    false    217            �           0    0    user_info_user_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.user_info_user_id_seq', 6, true);
          public          postgres    false    215            (           2606    16457    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    218            &           2606    16445    user_info user_info_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);
 B   ALTER TABLE ONLY public.user_info DROP CONSTRAINT user_info_pkey;
       public            postgres    false    216            �   U  x��ˊGE�3_�����xe�W��Mu=@-� ��}n��c������x�{#"�)�~���O��>�����v�_>��=����.����kX�b�-Zo���z����?ǾU�4Oa��Yi�=w�w�7��|Ò_�ԉ2��L$�ᝈW��������<On>J���ǴZ����<�j��i��gՈE�k����y���o�����t�G(~�#7b������&��poT�:�d����7���X������߾׿��R�E��:&��Dp�-p�[�ZL
���B�)��|�Ue54��@7aإX�Q%�1I�T{��"��H�<�a?Ȳx��GZ���ݷDd�����I��$.�s��f�$C�֑N��H�eT��llQy����ݖ'YU5��M`ˈ^t���/P��Ph�0d��Z��Ӂ�-��+1j��m�ըw+T�j�*����rݫ�u��A�Ѫ�����'����	IqM�+c���f�Ւ���3u2�����,�{����7O�o������_��sv���x���3�k�&��M-4��0?j�e�Ãٲ��`y��e8i}��qטX�@sgmY~�3�`c��N=O�f�0{-b�E�!f��f%���֨3��;E��DY�b�n9�~#�+��v���,�\��ү��ϩ*�U���}y�\�PÞ�Q
�/B��h�� v�M��Θ�n�U���e��1*�I!D#�?�gP�:;�x�#�Χ5���@a�ׂZf�	�۴�P�R��W�Tڨ��N��	\u�ϝ�P��v�6�_�9eZU��L=]�)� c��.P���9U�d&hӁ7x�A��\�iu�ul�ǆR�<�uL��a��=ՌI��?� S-��R� ����1#���d��V@b *l5�Ճ� �.��<����R�A�R,�����f5;�$s�&b�^ڶR�6������k�/<@hݰܭɗ�~H�if��\5�T<w!�!��nƄ"�*�h6�iG=����L���q���6�?�,@&�X�w�w��>�Ҧ����[:���s�v��cjPR�,�.�Ag�������dpH��l!6�h(Cum�&6�&v��n�ӧ4�U��"��}��X'�5Eg�\��E��s��6iy�h�?:�������4��ig6�VeH�LAvqK~��<��C�ݕ�è�����E���)���}�vhj�65����U�- ��CǓ�d�kS�����]?o4M*'�hל7;�����Rm��؋��:>���%^lyZ���>���>���>���>���>�������䋍O�v�����������H�k      �   �  x���ٮ�@  ���;|�v�.��q�K�2 �2���
_��6iڤ�~�98�;��"kpB\��p	TY��� ��e�����L�0�q#�iZ��S+���^��J��h�0y�z����~�?��Z�"� �����������K/t"|=�����m�ݰ>�Q�S�*��DU��x��C��t�pTޯZ�xW<����-�i;�pL�����7�S���c�:T�7�}�n<im��ڶ��c������	��J�E�|�w�lꎫȓQ���)qzD3�k�}jp��&�7�=X�8�˅��ɒ*�k��������ߡk+v��A�󾵠�-�4:�Ih6k3@y��jH�"Zu�����:8�����ɆG�X(�V��[e~�s�a��2�:V���s��Y���=c��t�IF�p�q���;ƙ�0     