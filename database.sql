PGDMP      $    
            |            travelpoint    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16436    travelpoint    DATABASE     �   CREATE DATABASE travelpoint WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE travelpoint;
                postgres    false            �            1259    16438 	   user_info    TABLE       CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    phone_number bigint NOT NULL,
    location character varying(50) NOT NULL,
    password character varying NOT NULL
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
          public          postgres    false    215                       2604    16441    user_info user_id    DEFAULT     v   ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);
 @   ALTER TABLE public.user_info ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    16438 	   user_info 
   TABLE DATA           e   COPY public.user_info (user_id, first_name, last_name, phone_number, location, password) FROM stdin;
    public          postgres    false    216   �       �           0    0    user_info_user_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.user_info_user_id_seq', 3, true);
          public          postgres    false    215                       2606    16445    user_info user_info_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);
 B   ALTER TABLE ONLY public.user_info DROP CONSTRAINT user_info_pkey;
       public            postgres    false    216            �   �   x���Kr�0 �ur�`@[(U�:e���"�� ��w�tz��#Ȼ���O-�����D��͕�!+��0�4w@�~Q��ƴ5i�Վ�5[q.,x���m\�,h&j׳J87�{ږ{�_ӫ�S��S����Has�-��Æ�$��8_2�y"�\���	�7�F�a㟺7�������ګ��"�K�8�y�Ԛ3��1?|O���}��b�F�\     