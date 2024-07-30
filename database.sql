PGDMP  8    4                |            travelpoint    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16436    travelpoint    DATABASE     �   CREATE DATABASE travelpoint WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE travelpoint;
                postgres    false            �            1259    16449    posts    TABLE     �   CREATE TABLE public.posts (
    id integer NOT NULL,
    poster integer NOT NULL,
    caption character varying(255) NOT NULL,
    image bytea NOT NULL,
    "timestamp" timestamp with time zone DEFAULT now() NOT NULL
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
       public          postgres    false    217    218    218                       2604    16441    user_info user_id    DEFAULT     v   ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);
 @   ALTER TABLE public.user_info ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    16449    posts 
   TABLE DATA           H   COPY public.posts (id, poster, caption, image, "timestamp") FROM stdin;
    public          postgres    false    218   �       �          0    16438 	   user_info 
   TABLE DATA           z   COPY public.user_info (user_id, first_name, last_name, phone_number, location, password, nic_passport, email) FROM stdin;
    public          postgres    false    216   �       �           0    0    posts_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.posts_id_seq', 7, true);
          public          postgres    false    217            �           0    0    user_info_user_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.user_info_user_id_seq', 6, true);
          public          postgres    false    215            '           2606    16457    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    218            %           2606    16445    user_info user_info_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);
 B   ALTER TABLE ONLY public.user_info DROP CONSTRAINT user_info_pkey;
       public            postgres    false    216            �   !  x�Ŗ�n%ED��W�ͨ��U5_��v6��f�0�='�z�A��|�v߬|DDfv=��O�^~�~����Ï���y�|�}{���v�ȍO���X�r�ͷhY<iz����=�}��n��Yi����;��ۼ߱��t����<��Gx'��=�-��z(y0�ˇ������V���V��Xm�^#�"����|m3��>o�����OM/M�|��w?s#��_��]59h� ą{�Z�&�Y�?5�T�'c�qrr�|�]��E��"_y��{"8�8=�A-&�U�s�soʁ�1�WYC͇��:�Mv)ևo�@�p�FR�����>ZdI��5�Yw�|���z:|K�@�h-o|\�H�F?��4C&�䰎t
�D�,�"dc���/�϶�Ȫ��Y4l�h[F��C�d}��=��@�;��8k�O'�{n�Wb�b)�Z�Q�V�6
պU���=%�Wu�(�����U}'�-Nz���!$��NW�b֙��%/˿�g�d^����,�w�ğ��WO�+�����f�ί�M�9;�Ho�E�q����=u�|�SM3�<���`���`��+X(�BN�Go::K�h�-���y&BlL1�i"���̃�`�E��8�Lv��ĿP��u��:`��_�(�U�-'�wr��hg�����ˍ�n��w|NU��2t��˳�j��<�RH~�tG����wY2;c*�EW�R;3��JǨ�&��(���A����uo��>��XГW��^j�}�^$�zl�B�K5�; _�Ri�J��:��'p�CO�w�C����h\��s:ʴ�V��z6�tSR82�nW]�N�ps�@�LЦwx�A��\�iu�ul�ǆR�<�uL��a��=ՌI��?� S-��R� ����1#���d��V@b *l5�Ճ� �.��<����R�I�R,�����f5;�"s�&b�QڶR�6���9����_x�"�ڱ<�ɗ�~H�if��\5�T<w!�!��nƄ"�*�h6�iG=����L���q���6�?�,@&�X�w�w��>�Ҧ����S:����S���95()y@�rFؠ3�Xx�Z�28�XM�H4����6wF��XF7h��S�𪗞"��}��X'�5Eg�ܶ�E�����6iy�h�?:���7�5Pi�5&��l4�ʐ.�� ���;y0������_F%�%l�^��qH��iɞ�/�MMЦ��1��{�f����$.��ڔ�)~DcFj��7�&�a�{΋�Χ�4���G[?,����:>���%>����������wO      �   �  x���ٮ�@  ���;|�v�.��q�K�2 �2���
_��6iڤ�~�98�;��"kpB\��p	TY��� ��e�����L�0�q#�iZ��S+���^��J��h�0y�z����~�?��Z�"� �����������K/t"|=�����m�ݰ>�Q�S�*��DU��x��C��t�pTޯZ�xW<����-�i;�pL�����7�S���c�:T�7�}�n<im��ڶ��c������	��J�E�|�w�lꎫȓQ���)qzD3�k�}jp��&�7�=X�8�˅��ɒ*�k��������ߡk+v��A�󾵠�-�4:�Ih6k3@y��jH�"Zu�����:8�����ɆG�X(�V��[e~�s�a��2�:V���s��Y���=c��t�IF�p�q���;ƙ�0     